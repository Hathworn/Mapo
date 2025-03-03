; ModuleID = '../data/hip_kernels/6394/6/main.cu'
source_filename = "../data/hip_kernels/6394/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z31initializeChar1DRangepopulationPciiP12hiprandStateiS_(i8 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, %struct.hiprandState addrspace(1)* nocapture %3, i32 %4, i8 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = mul nsw i32 %2, %1
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %51

18:                                               ; preds = %6
  %19 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 0
  %20 = load i32, i32 addrspace(1)* %19, align 8, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 0
  %22 = load i32, i32 addrspace(1)* %21, align 8, !amdgpu.noclobber !5
  %23 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 1
  %24 = load i32, i32 addrspace(1)* %23, align 4, !amdgpu.noclobber !5
  %25 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 2
  %26 = load i32, i32 addrspace(1)* %25, align 8, !amdgpu.noclobber !5
  %27 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 3
  %28 = load i32, i32 addrspace(1)* %27, align 4, !amdgpu.noclobber !5
  %29 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %3, i64 0, i32 0, i32 0, i32 5, i64 4
  %30 = load i32, i32 addrspace(1)* %29, align 8, !amdgpu.noclobber !5
  %31 = lshr i32 %22, 2
  %32 = xor i32 %31, %22
  %33 = shl i32 %30, 4
  %34 = shl i32 %32, 1
  %35 = xor i32 %34, %33
  %36 = xor i32 %35, %32
  %37 = xor i32 %36, %30
  %38 = add i32 %20, 362437
  %39 = add i32 %37, %38
  %40 = uitofp i32 %39 to float
  %41 = fmul contract float %40, 0x3DF0000000000000
  %42 = fadd contract float %41, 0x3DF0000000000000
  store i32 %38, i32 addrspace(1)* %19, align 8
  store i32 %24, i32 addrspace(1)* %21, align 8
  store i32 %26, i32 addrspace(1)* %23, align 4
  store i32 %28, i32 addrspace(1)* %25, align 8
  store i32 %30, i32 addrspace(1)* %27, align 4
  store i32 %37, i32 addrspace(1)* %29, align 8
  %43 = sitofp i32 %2 to float
  %44 = fmul contract float %42, %43
  %45 = fptosi float %44 to i32
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7
  %49 = sext i32 %15 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %49
  store i8 %48, i8 addrspace(1)* %50, align 1, !tbaa !7
  br label %51

51:                                               ; preds = %18, %6
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
