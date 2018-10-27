################################################################################
#                          TEST: Euler Angle and Axis
################################################################################

# Test constructions.
for k = 1:samples
    # Sample a random vector and angle.
    a = rand()
    v = rand(3)

    angleaxis = EulerAngleAxis(a,v)

    # Check if the representation was created correctly.
    @test angleaxis.a == a
    @test angleaxis.v == v
end

# Test types.
@test typeof(EulerAngleAxis(1, [1;1;1])) <: EulerAngleAxis{Int}
@test typeof(EulerAngleAxis(1.f0, Float32[1;1;1])) <: EulerAngleAxis{Float32}
@test typeof(EulerAngleAxis(1.f0, [1;1;1])) <: EulerAngleAxis{Float32}

# Test exceptions.
@test_throws Exception EulerAngleAxis(randn(), [1;1;1;1])
@test_throws Exception EulerAngleAxis(randn(), [1;1])
@test_throws Exception EulerAngleAxis(randn(), SVector{4,Int}[1;1;1;1])
@test_throws Exception EulerAngleAxis(randn(), SVector{4,Float32}[1;1;1;1])
@test_throws Exception EulerAngleAxis(randn(), SVector{4,Float64}[1;1;1;1])
@test_throws Exception EulerAngleAxis(randn(), SVector{2,Int}[1;1])
@test_throws Exception EulerAngleAxis(randn(), SVector{2,Float32}[1;1])
@test_throws Exception EulerAngleAxis(randn(), SVector{2,Float64}[1;1])