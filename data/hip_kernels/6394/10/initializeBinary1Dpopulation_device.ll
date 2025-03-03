; ModuleID = '../data/hip_kernels/6394/10/main.cu'
source_filename = "../data/hip_kernels/6394/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z28initializeBinary1DpopulationPiiiP12hiprandStatei(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, %struct.hiprandState addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul nsw i32 %2, %1
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %46

17:                                               ; preds = %5
  %18 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 0
  %19 = load i32, i32 addrspace(1)* %18, align 8, !amdgpu.noclobber !5
  %20 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 0
  %21 = load i32, i32 addrspace(1)* %20, align 8, !amdgpu.noclobber !5
  %22 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 1
  %23 = load i32, i32 addrspace(1)* %22, align 4, !amdgpu.noclobber !5
  %24 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 2
  %25 = load i32, i32 addrspace(1)* %24, align 8, !amdgpu.noclobber !5
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 3
  %27 = load i32, i32 addrspace(1)* %26, align 4, !amdgpu.noclobber !5
  %28 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 4
  %29 = load i32, i32 addrspace(1)* %28, align 8, !amdgpu.noclobber !5
  %30 = lshr i32 %21, 2
  %31 = xor i32 %30, %21
  %32 = shl i32 %29, 4
  %33 = shl i32 %31, 1
  %34 = xor i32 %33, %32
  %35 = xor i32 %34, %31
  %36 = xor i32 %35, %29
  %37 = add i32 %19, 362437
  %38 = add i32 %36, %37
  %39 = uitofp i32 %38 to float
  %40 = fmul contract float %39, 0x3DF0000000000000
  %41 = fadd contract float %40, 0x3DF0000000000000
  store i32 %37, i32 addrspace(1)* %18, align 8
  store i32 %23, i32 addrspace(1)* %20, align 8
  store i32 %25, i32 addrspace(1)* %22, align 4
  store i32 %27, i32 addrspace(1)* %24, align 8
  store i32 %29, i32 addrspace(1)* %26, align 4
  store i32 %36, i32 addrspace(1)* %28, align 8
  %42 = fmul contract float %41, 2.000000e+00
  %43 = fptosi float %42 to i32
  %44 = sext i32 %14 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  store i32 %43, i32 addrspace(1)* %45, align 4, !tbaa !7
  br label %46

46:                                               ; preds = %17, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
