//
//  ASCollectionNode+Diff.swift
//  DodiUI
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import AsyncDisplayKit
import DeepDiff

extension ASCollectionNode {

  /// Animate reload in a batch update
  ///
  /// - Parameters:
  ///   - changes: The changes from diff
  ///   - section: The section that all calculated IndexPath belong
  ///   - animated: The animation for performBatch
  ///   - completion: Called when operation completes
  public func reload<T: DiffAware>(
    changes: [Change<T>],
    section: Int,
    animated: Bool,
    batchUpdate: (() -> Void)? = nil,
    completion: ((Bool) -> Void)?) {

    let changesWithIndexPath = IndexPathConverter().convert(changes: changes, section: section)

    self.performBatch(animated: animated, updates: {
      batchUpdate?()
      self.internalBatchUpdates(changesWithIndexPath: changesWithIndexPath)
    }, completion: completion)

    changesWithIndexPath.replaces.executeIfPresent {
      self.reloadItems(at: $0)
    }
  }

  public func reloadSections<T: DiffAware>(
    changes: [Change<T>],
    animated: Bool,
    completion: ((Bool) -> Void)? = nil) {

    self.performBatch(animated: animated, updates: {

      changes.compactMap({ $0.delete }).map({ $0.index })
        .executeIfPresent({ sections in

          self.deleteSections(IndexSet(sections))
        })

      changes.compactMap({ $0.insert }).map({ $0.index })
        .executeIfPresent({ sections in

          self.insertSections(IndexSet(sections))
        })

      changes.compactMap({ $0.move })
        .executeIfPresent({ moves in

          for move in moves {
            self.moveSection(move.fromIndex, toSection: move.toIndex)
          }
        })

    }, completion: completion)

    self.reloadSections(
      IndexSet(changes.compactMap({ $0.replace }).map({ $0.index }))
    )
  }

  // MARK: - Helper

  private func internalBatchUpdates(changesWithIndexPath: ChangeWithIndexPath) {

    changesWithIndexPath.deletes.executeIfPresent {
      self.deleteItems(at: $0)
    }

    changesWithIndexPath.inserts.executeIfPresent {
      self.insertItems(at: $0)
    }

    changesWithIndexPath.moves.executeIfPresent {
      $0.forEach { move in
        self.moveItem(at: move.from, to: move.to)
      }
    }
  }
}
