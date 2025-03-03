; ModuleID = '../data/hip_kernels/9634/2/main.cu'
source_filename = "../data/hip_kernels/9634/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4dualPfS_S_S_S_ffiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float %5, float %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = add i32 %18, %11
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = icmp slt i32 %19, %7
  %29 = icmp slt i32 %27, %8
  %30 = select i1 %28, i1 %29, i1 false
  %31 = icmp sgt i32 %9, 0
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %94

33:                                               ; preds = %10
  %34 = mul nsw i32 %27, %7
  %35 = mul nsw i32 %8, %7
  %36 = add nsw i32 %19, 1
  %37 = icmp slt i32 %36, %7
  %38 = icmp sgt i32 %19, 0
  %39 = add nsw i32 %27, 1
  %40 = icmp slt i32 %39, %8
  %41 = icmp sgt i32 %27, 0
  %42 = add nsw i32 %27, -1
  %43 = mul nsw i32 %42, %7
  %44 = fmul contract float %5, %6
  %45 = fadd contract float %44, 1.000000e+00
  br label %46

46:                                               ; preds = %33, %77
  %47 = phi i32 [ 0, %33 ], [ %92, %77 ]
  %48 = mul nsw i32 %35, %47
  %49 = add i32 %48, %19
  %50 = add i32 %49, %34
  br i1 %37, label %51, label %55

51:                                               ; preds = %46
  %52 = sext i32 %50 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %46, %51
  %56 = phi contract float [ %54, %51 ], [ 0.000000e+00, %46 ]
  br i1 %38, label %57, label %63

57:                                               ; preds = %55
  %58 = add nsw i32 %49, -1
  %59 = add i32 %58, %34
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  br label %63

63:                                               ; preds = %55, %57
  %64 = phi contract float [ %62, %57 ], [ 0.000000e+00, %55 ]
  %65 = fsub contract float %56, %64
  br i1 %40, label %66, label %70

66:                                               ; preds = %63
  %67 = sext i32 %50 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %63, %66
  %71 = phi contract float [ %69, %66 ], [ 0.000000e+00, %63 ]
  br i1 %41, label %72, label %77

72:                                               ; preds = %70
  %73 = add i32 %49, %43
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %70, %72
  %78 = phi contract float [ %76, %72 ], [ 0.000000e+00, %70 ]
  %79 = fsub contract float %71, %78
  %80 = sext i32 %50 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fadd contract float %65, %79
  %84 = fmul contract float %83, %5
  %85 = fadd contract float %82, %84
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %80
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = fmul contract float %44, %87
  %89 = fadd contract float %88, %85
  %90 = fdiv contract float %89, %45
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  store float %90, float addrspace(1)* %91, align 4, !tbaa !7
  %92 = add nuw nsw i32 %47, 1
  %93 = icmp eq i32 %92, %9
  br i1 %93, label %94, label %46, !llvm.loop !11

94:                                               ; preds = %77, %10
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
