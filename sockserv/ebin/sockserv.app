{application, sockserv,
 [{description, "test"},
  {vsn, "1.0.0"},
  {registered, [sockserv]},
  {applications, [
                  kernel,
                  stdlib
                 ]},
  {mod, { sockserv, []}},
  {modules, [sockserv, sockserv_sup, sockserv_worker]},
  {env, []}
 ]}.
