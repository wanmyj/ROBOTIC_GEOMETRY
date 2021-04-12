function ThePoint=OnePointOnPlaneClose2AnotherPoint(point, plane)

Sol=cross(point,plane(2:4));
ThePoint=(cross(plane(2:4),Sol)-plane(2:4)*plane(1))/dot(plane(2:4),plane(2:4));
