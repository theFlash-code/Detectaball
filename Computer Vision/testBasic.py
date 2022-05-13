from operator import itemgetter
points = [[290,312],[179,417],[808,302],[928,405]]
print(sorted(points, key = itemgetter(0)))
print(points)