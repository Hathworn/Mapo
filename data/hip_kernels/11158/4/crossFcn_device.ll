; ModuleID = '../data/hip_kernels/11158/4/main.cu'
source_filename = "../data/hip_kernels/11158/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

@c_LB = protected local_unnamed_addr addrspace(1) externally_initialized global [10 x float] zeroinitializer, align 16
@c_UB = protected local_unnamed_addr addrspace(1) externally_initialized global [10 x float] zeroinitializer, align 16
@c_a = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aa = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aaa = protected local_unnamed_addr addrspace(1) externally_initialized global float* null, align 8
@c_aRow = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@c_aaaRow = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@c_Dysum = protected local_unnamed_addr addrspace(1) externally_initialized global [9 x float] zeroinitializer, align 16

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8crossFcnPfP12hiprandState(float addrspace(1)* nocapture %0, %struct.hiprandState addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %4, i32 0, i32 0, i32 0
  %6 = load i32, i32 addrspace(1)* %5, align 8
  %7 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %4, i32 0, i32 0, i32 5, i64 0
  %8 = load i32, i32 addrspace(1)* %7, align 8
  %9 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %4, i32 0, i32 0, i32 5, i64 4
  %10 = load i32, i32 addrspace(1)* %9, align 8
  %11 = lshr i32 %8, 2
  %12 = xor i32 %11, %8
  %13 = shl i32 %10, 4
  %14 = shl i32 %12, 1
  %15 = xor i32 %13, %14
  %16 = xor i32 %15, %10
  %17 = xor i32 %16, %12
  %18 = add i32 %6, 362437
  %19 = add i32 %18, %17
  %20 = uitofp i32 %19 to float
  %21 = fmul contract float %20, 0x3DF0000000000000
  %22 = fadd contract float %21, 0x3DF0000000000000
  %23 = fpext float %22 to double
  %24 = fcmp contract olt double %23, 8.000000e-01
  br i1 %24, label %25, label %109

25:                                               ; preds = %2
  %26 = and i32 %19, 1
  %27 = icmp eq i32 %26, 0
  %28 = mul nuw nsw i32 %3, 10
  br i1 %27, label %109, label %29

29:                                               ; preds = %25
  %30 = zext i32 %28 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5
  %33 = add nuw nsw i32 %28, 640
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5
  store float %36, float addrspace(1)* %31, align 4, !tbaa !5
  store float %32, float addrspace(1)* %35, align 4, !tbaa !5
  %37 = or i32 %28, 1
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  %41 = add nuw nsw i32 %28, 641
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !5
  store float %44, float addrspace(1)* %39, align 4, !tbaa !5
  store float %40, float addrspace(1)* %43, align 4, !tbaa !5
  %45 = add nuw nsw i32 %28, 2
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5
  %49 = add nuw nsw i32 %28, 642
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5
  store float %52, float addrspace(1)* %47, align 4, !tbaa !5
  store float %48, float addrspace(1)* %51, align 4, !tbaa !5
  %53 = add nuw nsw i32 %28, 3
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5
  %57 = add nuw nsw i32 %28, 643
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  store float %60, float addrspace(1)* %55, align 4, !tbaa !5
  store float %56, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = add nuw nsw i32 %28, 4
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5
  %65 = add nuw nsw i32 %28, 644
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5
  store float %68, float addrspace(1)* %63, align 4, !tbaa !5
  store float %64, float addrspace(1)* %67, align 4, !tbaa !5
  %69 = add nuw nsw i32 %28, 5
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = add nuw nsw i32 %28, 645
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5
  store float %76, float addrspace(1)* %71, align 4, !tbaa !5
  store float %72, float addrspace(1)* %75, align 4, !tbaa !5
  %77 = add nuw nsw i32 %28, 6
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5
  %81 = add nuw nsw i32 %28, 646
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5
  store float %84, float addrspace(1)* %79, align 4, !tbaa !5
  store float %80, float addrspace(1)* %83, align 4, !tbaa !5
  %85 = add nuw nsw i32 %28, 7
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = add nuw nsw i32 %28, 647
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  store float %92, float addrspace(1)* %87, align 4, !tbaa !5
  store float %88, float addrspace(1)* %91, align 4, !tbaa !5
  %93 = add nuw nsw i32 %28, 8
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5
  %97 = add nuw nsw i32 %28, 648
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5
  store float %100, float addrspace(1)* %95, align 4, !tbaa !5
  store float %96, float addrspace(1)* %99, align 4, !tbaa !5
  %101 = add nuw nsw i32 %28, 9
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !5
  %105 = add nuw nsw i32 %28, 649
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5
  store float %108, float addrspace(1)* %103, align 4, !tbaa !5
  store float %104, float addrspace(1)* %107, align 4, !tbaa !5
  br label %109

109:                                              ; preds = %29, %25, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
