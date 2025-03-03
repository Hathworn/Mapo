; ModuleID = '../data/hip_kernels/291/5/main.cu'
source_filename = "../data/hip_kernels/291/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26cn_pnpoly_reference_kernelPiP15HIP_vector_typeIfLj2EES2_i(i32 addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %106

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 0
  %18 = load float, float addrspace(1)* %17, align 8, !amdgpu.noclobber !5
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %16, i32 0, i32 0, i32 0, i64 1
  %20 = load float, float addrspace(1)* %19, align 4, !amdgpu.noclobber !5
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 599, i32 0, i32 0, i32 0, i64 1
  %22 = load float, float addrspace(1)* %21, align 4
  br label %25

23:                                               ; preds = %102
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  store i32 %103, i32 addrspace(1)* %24, align 4, !tbaa !7
  br label %106

25:                                               ; preds = %102, %15
  %26 = phi float [ %22, %15 ], [ %84, %102 ]
  %27 = phi i32 [ 0, %15 ], [ %103, %102 ]
  %28 = phi i32 [ 599, %15 ], [ %79, %102 ]
  %29 = phi i32 [ 0, %15 ], [ %104, %102 ]
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %30, i32 0, i32 0, i32 0, i64 0
  %32 = load float, float addrspace(1)* %31, align 8, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %30, i32 0, i32 0, i32 0, i64 1
  %34 = load float, float addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = fcmp contract ule float %34, %20
  %36 = fcmp contract ogt float %26, %20
  %37 = xor i1 %35, %36
  br i1 %37, label %52, label %38

38:                                               ; preds = %25
  %39 = zext i32 %28 to i64
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %39, i32 0, i32 0, i32 0, i64 0
  %41 = load float, float addrspace(1)* %40, align 8, !amdgpu.noclobber !5
  %42 = fsub contract float %41, %32
  %43 = fsub contract float %26, %34
  %44 = fdiv contract float %42, %43
  %45 = fsub contract float %20, %34
  %46 = fmul contract float %45, %44
  %47 = fadd contract float %32, %46
  %48 = fcmp contract olt float %18, %47
  %49 = icmp eq i32 %27, 0
  %50 = zext i1 %49 to i32
  %51 = select i1 %48, i32 %50, i32 %27
  br label %52

52:                                               ; preds = %38, %25
  %53 = phi i32 [ %27, %25 ], [ %51, %38 ]
  %54 = add nuw nsw i32 %29, 1
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %55, i32 0, i32 0, i32 0, i64 0
  %57 = load float, float addrspace(1)* %56, align 8, !amdgpu.noclobber !5
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %55, i32 0, i32 0, i32 0, i64 1
  %59 = load float, float addrspace(1)* %58, align 4, !amdgpu.noclobber !5
  %60 = fcmp contract ule float %59, %20
  %61 = fcmp contract ogt float %34, %20
  %62 = xor i1 %60, %61
  br i1 %62, label %77, label %63

63:                                               ; preds = %52
  %64 = zext i32 %29 to i64
  %65 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %64, i32 0, i32 0, i32 0, i64 0
  %66 = load float, float addrspace(1)* %65, align 8, !amdgpu.noclobber !5
  %67 = fsub contract float %66, %57
  %68 = fsub contract float %34, %59
  %69 = fdiv contract float %67, %68
  %70 = fsub contract float %20, %59
  %71 = fmul contract float %70, %69
  %72 = fadd contract float %57, %71
  %73 = fcmp contract olt float %18, %72
  %74 = icmp eq i32 %53, 0
  %75 = zext i1 %74 to i32
  %76 = select i1 %73, i32 %75, i32 %53
  br label %77

77:                                               ; preds = %63, %52
  %78 = phi i32 [ %53, %52 ], [ %76, %63 ]
  %79 = add nuw nsw i32 %29, 2
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %80, i32 0, i32 0, i32 0, i64 0
  %82 = load float, float addrspace(1)* %81, align 8, !amdgpu.noclobber !5
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %80, i32 0, i32 0, i32 0, i64 1
  %84 = load float, float addrspace(1)* %83, align 4, !amdgpu.noclobber !5
  %85 = fcmp contract ule float %84, %20
  %86 = fcmp contract ogt float %59, %20
  %87 = xor i1 %85, %86
  br i1 %87, label %102, label %88

88:                                               ; preds = %77
  %89 = zext i32 %54 to i64
  %90 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %89, i32 0, i32 0, i32 0, i64 0
  %91 = load float, float addrspace(1)* %90, align 8, !amdgpu.noclobber !5
  %92 = fsub contract float %91, %82
  %93 = fsub contract float %59, %84
  %94 = fdiv contract float %92, %93
  %95 = fsub contract float %20, %84
  %96 = fmul contract float %95, %94
  %97 = fadd contract float %82, %96
  %98 = fcmp contract olt float %18, %97
  %99 = icmp eq i32 %78, 0
  %100 = zext i1 %99 to i32
  %101 = select i1 %98, i32 %100, i32 %78
  br label %102

102:                                              ; preds = %88, %77
  %103 = phi i32 [ %78, %77 ], [ %101, %88 ]
  %104 = add nuw nsw i32 %29, 3
  %105 = icmp eq i32 %104, 600
  br i1 %105, label %23, label %25, !llvm.loop !11

106:                                              ; preds = %23, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
