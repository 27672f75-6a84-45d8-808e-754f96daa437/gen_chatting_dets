# GenChattingDets

## TODO_list

1. gen_chatting stash 구현
    - 예기치 못한 오류로 프로세스가 종료 후 재시작시 dets를 활용하여 연결되어있었던 클라이언트 데이터를 불러와 다시 연결하도록 한다.

2. 모든 프로세스 종료시 dets로 저장한 파일 삭제하기
    - 이전에 저장된 클라이언트 프로세스 정보와 현재 클라이언트 프로세스 정보가 다르기 때문에 이전 정보를 지워줘야한다.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gen_chatting_dets` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gen_chatting_dets, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/gen_chatting_dets>.

