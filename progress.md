# progress.md — RxSwiftSample

<!-- progress-collection:v1
{"project_id":"RxSwiftSample","monitor":true,"instruction_target":"existing-codex","dispatch_policy":"verified-only","host":null,"thread_id":null,"status":"NEEDS_TRIAGE","last_verified_at":null}
-->

## 監視/指示対象
- `progress-collection` 監視対象かつ既存Codexへの指示候補。担当ホスト・既存threadが未確認のため実際の送信は保留。
- 初期ステータス `NEEDS_TRIAGE`。READMEと既存ソース・タスク・停止指示を確認するまでREADYやPASSにはしない。

## 既存記録から照合する候補
- [ ] RxSwiftのサンプルについて明示されたTODO/再現可能なテスト失敗がある場合のみ小タスク1件。なければNO_TASK。
- 候補は実際の未完了を保証しない。過去の改修・テスト・正本から実在を確認し、不明ならNO_TASKとする。

## 実行証拠の記録
| 時刻 | task_id | 状態 | 変更ファイル | テストコマンド/結果 | ブロッカー | 次タスク |
| --- | --- | --- | --- | --- | --- | --- |
| 未確認 | 未確定 | NEEDS_TRIAGE | なし | 未実行 | 実際の担当/対象差分が未確認 | 既存未完了1件を照合 |

## 次のループ
`AGENTS.md` と `docs/LOOP_ENGINEERING.md` を確認し、実在する未完了1件に現状→仮説→最小変更→検証→評価→引継ぎを適用。停止指示・古い依存・上流ライセンスを尊重。監視記録だけをPASSにしない。
