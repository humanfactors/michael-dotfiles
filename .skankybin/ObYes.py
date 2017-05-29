"""
Not quite a dysfunctinal docstring
"""
doc = '{s:{c}^{n}}'.format(s = "".join([x for i in [h[1] for t in [enumerate(__doc__.split())] for h in t if h[0] == 4] for x in i][:3]), n = 7, c = '_').strip(' ')

result = "".join(x for x in [str(eval(doc))[i] for i in [3+3+8]])+().__iter__().__class__.__name__[8]+[].__class__.__name__[2]

print(result)
