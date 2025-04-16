```Shell
.todo_cache_pooling/
├── README.md
├── _build/
│   ├── dev/
│   │   └── lib/
│   └── test/
│       └── lib/
├── lib/
│   └── todo/
│       ├── cache.ex
│       ├── database.ex
│       ├── database_worker.ex
│       ├── list.ex
│       └── server.ex
├── mix.exs
├── persist/
│   └── bobs_list
└── test/
    ├── test_helper.exs
    └── todo/
        ├── cache_test.exs
        └── list_test.exs
```







# Implement

```Shell
iex(1)> {:ok, cache} = Todo.Cache.start()
{:ok, #PID<0.135.0>}
iex(2)> fiona_list = Todo.Cache.server_process(cache, "Fiona_list")
#PID<0.140.0>
iex(3)> Todo.Server.add_entry(
...(3)> fiona_list,
...(3)> %{date: ~D[2023-12-20], title: "occupation"}
...(3)> )
:ok
iex(4)> Todo.Server.entries(fiona_list, ~D[2023-12-20])
[%{id: 1, date: ~D[2023-12-20], title: "occupation"}]
--- Exit shell: data is saves in persist file as Fiona_list
iex(1)> {:ok, cache} = Todo.Cache.start()
{:ok, #PID<0.136.0>}
iex(2)> fiona_list = Todo.Cache.server_process(cache, "Fiona_list")
#PID<0.141.0>
iex(3)> Todo.Server.entries(fiona_list, ~D[2023-12-19])
[]
iex(4)> Todo.Server.entries(fiona_list, ~D[2023-12-20])
[%{id: 1, date: ~D[2023-12-20], title: "occupation"}]
```