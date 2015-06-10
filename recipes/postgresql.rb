package "postgresql-#{node['manatee']['pg_version']}"

# TODO(jpg) This could be much better
execute 'drop default cluster' do
  command 'pg_dropcluster 9.4 main'
  only_if 'pg_lsclusters | grep main'
end
