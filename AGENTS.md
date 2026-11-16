# Agent Policy / Loop Engineering — RxSwiftSample

RxSwiftの小規模サンプル。実在の作業指示がない限り保守対象外。

- [一回の開発ループ](docs/LOOP_ENGINEERING.md) / [Codex起動プロンプト](prompts/CODEX_LOOP.md)を参照。
- 既存のユーザー指示/ライセンス/停止条件が優先。実在するタスクがなければ新規機能を捏造しない。
- 1タスクにつき現状→仮説→変更→検証→分類→次工程。権限がない操作を行わない。


## progress-collection対応（2026-11-17）
- `progress.md` を監視と既存Codexへの指示候補の正本として登録。実機で既存 `PROGRESS.md` がある場合は二重作成しない。
- 開発ループ終了時に、実装差分・検証証拠・状態/次タスクを更新する。未完了の根拠がなければNO_TASK。
- 実際の指示送信はホスト/既存thread/権限が確認された場合のみ。監視だけをPASSとしない。
