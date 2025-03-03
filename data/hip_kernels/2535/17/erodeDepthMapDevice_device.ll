; ModuleID = '../data/hip_kernels/2535/17/main.cu'
source_filename = "../data/hip_kernels/2535/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19erodeDepthMapDevicePfS_iiiff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp sgt i32 %16, -1
  br i1 %25, label %26, label %88

26:                                               ; preds = %7
  %27 = icmp slt i32 %16, %3
  %28 = icmp sgt i32 %24, -1
  %29 = select i1 %27, i1 %28, i1 false
  %30 = icmp slt i32 %24, %4
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %88

32:                                               ; preds = %26
  %33 = mul nsw i32 %24, %3
  %34 = add nsw i32 %33, %16
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = sub i32 0, %2
  %39 = icmp slt i32 %2, 0
  br i1 %39, label %47, label %40

40:                                               ; preds = %32, %58
  %41 = phi i32 [ %85, %58 ], [ 0, %32 ]
  %42 = phi i32 [ %59, %58 ], [ %38, %32 ]
  %43 = add nsw i32 %42, %24
  %44 = icmp slt i32 %43, 0
  %45 = icmp sge i32 %43, %4
  %46 = mul nsw i32 %43, %3
  br label %61

47:                                               ; preds = %58, %32
  %48 = phi i32 [ 0, %32 ], [ %85, %58 ]
  %49 = shl nsw i32 %2, 1
  %50 = add nuw nsw i32 %49, 1
  %51 = mul nsw i32 %50, %50
  %52 = uitofp i32 %48 to float
  %53 = uitofp i32 %51 to float
  %54 = fdiv contract float %52, %53
  %55 = fcmp contract ult float %54, %6
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %57 = select i1 %55, float %37, float 0xFFF0000000000000
  store float %57, float addrspace(1)* %56, align 4, !tbaa !7
  br label %88

58:                                               ; preds = %84
  %59 = add i32 %42, 1
  %60 = icmp eq i32 %42, %2
  br i1 %60, label %47, label %40, !llvm.loop !11

61:                                               ; preds = %40, %84
  %62 = phi i32 [ %41, %40 ], [ %85, %84 ]
  %63 = phi i32 [ %38, %40 ], [ %86, %84 ]
  %64 = add nsw i32 %63, %16
  %65 = icmp slt i32 %64, 0
  %66 = icmp sge i32 %64, %3
  %67 = select i1 %65, i1 true, i1 %66
  %68 = select i1 %67, i1 true, i1 %44
  %69 = select i1 %68, i1 true, i1 %45
  br i1 %69, label %84, label %70

70:                                               ; preds = %61
  %71 = add nsw i32 %64, %46
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fcmp contract oeq float %74, 0xFFF0000000000000
  %76 = fcmp contract oeq float %74, 0.000000e+00
  %77 = or i1 %75, %76
  %78 = fsub contract float %74, %37
  %79 = tail call float @llvm.fabs.f32(float %78)
  %80 = fcmp contract ogt float %79, %5
  %81 = select i1 %77, i1 true, i1 %80
  %82 = zext i1 %81 to i32
  %83 = add i32 %62, %82
  br label %84

84:                                               ; preds = %61, %70
  %85 = phi i32 [ %62, %61 ], [ %83, %70 ]
  %86 = add i32 %63, 1
  %87 = icmp eq i32 %63, %2
  br i1 %87, label %58, label %61, !llvm.loop !13

88:                                               ; preds = %47, %26, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
