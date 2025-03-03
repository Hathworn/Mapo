; ModuleID = '../data/hip_kernels/12756/39/main.cu'
source_filename = "../data/hip_kernels/12756/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15randomNumberingP12hiprandStatePiii(%struct.hiprandState addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %14, i32 0, i32 0, i32 0
  %16 = load i32, i32 addrspace(1)* %15, align 8
  %17 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %14, i32 0, i32 0, i32 5, i64 0
  %18 = load i32, i32 addrspace(1)* %17, align 8
  %19 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %14, i32 0, i32 0, i32 5, i64 1
  %20 = load i32, i32 addrspace(1)* %19, align 4
  %21 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %14, i32 0, i32 0, i32 5, i64 2
  %22 = load i32, i32 addrspace(1)* %21, align 8
  %23 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %14, i32 0, i32 0, i32 5, i64 3
  %24 = load i32, i32 addrspace(1)* %23, align 4
  %25 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %0, i64 %14, i32 0, i32 0, i32 5, i64 4
  %26 = load i32, i32 addrspace(1)* %25, align 8
  %27 = lshr i32 %18, 2
  %28 = xor i32 %27, %18
  %29 = shl i32 %26, 4
  %30 = shl i32 %28, 1
  %31 = xor i32 %30, %29
  %32 = xor i32 %31, %28
  %33 = xor i32 %32, %26
  %34 = add i32 %16, 362437
  %35 = add i32 %33, %34
  %36 = uitofp i32 %35 to float
  %37 = fmul contract float %36, 0x3DF0000000000000
  %38 = fadd contract float %37, 0x3DF0000000000000
  store i32 %34, i32 addrspace(1)* %15, align 8
  store i32 %20, i32 addrspace(1)* %17, align 8
  store i32 %22, i32 addrspace(1)* %19, align 4
  store i32 %24, i32 addrspace(1)* %21, align 8
  store i32 %26, i32 addrspace(1)* %23, align 4
  store i32 %33, i32 addrspace(1)* %25, align 8
  %39 = add nsw i32 %3, -1
  %40 = sitofp i32 %39 to double
  %41 = fadd contract double %40, 0x3FEFFFFDE7210BE9
  %42 = fpext float %38 to double
  %43 = fmul contract double %41, %42
  %44 = fptrunc double %43 to float
  %45 = fadd contract float %44, 1.000000e+00
  %46 = fptosi float %45 to i32
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  store i32 %46, i32 addrspace(1)* %47, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
