; ModuleID = '../data/hip_kernels/3550/7/main.cu'
source_filename = "../data/hip_kernels/3550/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16diffuseProject_kP15HIP_vector_typeIfLj2EES1_iiffi(%struct.HIP_vector_type addrspace(1)* nocapture %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, i32 %2, i32 %3, float %4, float %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %2
  %18 = icmp sgt i32 %6, 0
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %91

20:                                               ; preds = %7
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = mul i32 %26, %25
  %28 = add i32 %27, %21
  %29 = mul i32 %28, %6
  %30 = sdiv i32 %3, 2
  %31 = mul nsw i32 %16, %16
  %32 = fmul contract float %4, %5
  %33 = sitofp i32 %16 to float
  br label %34

34:                                               ; preds = %20, %88
  %35 = phi i32 [ 0, %20 ], [ %89, %88 ]
  %36 = add i32 %29, %35
  %37 = icmp slt i32 %36, %3
  br i1 %37, label %38, label %88

38:                                               ; preds = %34
  %39 = mul nsw i32 %36, %2
  %40 = add nsw i32 %39, %16
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 0, i64 0
  %43 = load float, float addrspace(1)* %42, align 8
  %44 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %41, i32 0, i32 0, i32 0, i64 1
  %45 = load float, float addrspace(1)* %44, align 4
  %46 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 0
  %47 = load float, float addrspace(1)* %46, align 8
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 1
  %49 = load float, float addrspace(1)* %48, align 4
  %50 = icmp sgt i32 %36, %30
  %51 = select i1 %50, i32 %3, i32 0
  %52 = sub nsw i32 %36, %51
  %53 = mul nsw i32 %52, %52
  %54 = add nuw nsw i32 %53, %31
  %55 = sitofp i32 %54 to float
  %56 = fmul contract float %32, %55
  %57 = fadd contract float %56, 1.000000e+00
  %58 = fdiv contract float 1.000000e+00, %57
  %59 = fmul contract float %58, %43
  %60 = fmul contract float %58, %45
  %61 = fmul contract float %58, %47
  %62 = fmul contract float %58, %49
  %63 = icmp eq i32 %54, 0
  br i1 %63, label %83, label %64

64:                                               ; preds = %38
  %65 = fdiv contract float 1.000000e+00, %55
  %66 = fmul contract float %59, %33
  %67 = sitofp i32 %52 to float
  %68 = fmul contract float %61, %67
  %69 = fadd contract float %66, %68
  %70 = fmul contract float %60, %33
  %71 = fmul contract float %62, %67
  %72 = fadd contract float %70, %71
  %73 = fmul contract float %65, %69
  %74 = fmul contract float %73, %33
  %75 = fsub contract float %59, %74
  %76 = fmul contract float %65, %72
  %77 = fmul contract float %76, %33
  %78 = fsub contract float %60, %77
  %79 = fmul contract float %73, %67
  %80 = fsub contract float %61, %79
  %81 = fmul contract float %76, %67
  %82 = fsub contract float %62, %81
  br label %83

83:                                               ; preds = %64, %38
  %84 = phi float [ %80, %64 ], [ %61, %38 ]
  %85 = phi float [ %82, %64 ], [ %62, %38 ]
  %86 = phi float [ %75, %64 ], [ %59, %38 ]
  %87 = phi float [ %78, %64 ], [ %60, %38 ]
  store float %86, float addrspace(1)* %42, align 8
  store float %87, float addrspace(1)* %44, align 4
  store float %84, float addrspace(1)* %46, align 8
  store float %85, float addrspace(1)* %48, align 4
  br label %88

88:                                               ; preds = %83, %34
  %89 = add nuw nsw i32 %35, 1
  %90 = icmp eq i32 %89, %6
  br i1 %90, label %91, label %34, !llvm.loop !7

91:                                               ; preds = %88, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
