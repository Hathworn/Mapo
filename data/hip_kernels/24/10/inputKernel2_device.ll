; ModuleID = '../data/hip_kernels/24/10/main.cu'
source_filename = "../data/hip_kernels/24/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z12inputKernel2Pfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = mul nsw i32 %20, 10
  %22 = add nsw i32 %12, %21
  %23 = icmp slt i32 %22, %2
  br i1 %23, label %24, label %95

24:                                               ; preds = %3
  %25 = icmp slt i32 %22, %1
  br i1 %25, label %26, label %32

26:                                               ; preds = %24
  %27 = sitofp i32 %22 to float
  %28 = fmul contract float %27, 2.000000e+00
  %29 = fmul contract float %27, %27
  %30 = fsub contract float %28, %29
  %31 = mul nsw i32 %22, %2
  br label %32

32:                                               ; preds = %24, %26
  %33 = phi i32 [ %31, %26 ], [ %22, %24 ]
  %34 = phi float [ %30, %26 ], [ 0.000000e+00, %24 ]
  %35 = sext i32 %33 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  store float %34, float addrspace(1)* %36, align 4, !tbaa !7
  %37 = icmp sgt i32 %2, 1
  br i1 %37, label %38, label %95

38:                                               ; preds = %32
  %39 = mul nsw i32 %22, %2
  %40 = add i32 %2, -1
  %41 = add i32 %2, -2
  %42 = and i32 %40, 7
  %43 = icmp ult i32 %41, 7
  br i1 %43, label %83, label %44

44:                                               ; preds = %38
  %45 = and i32 %40, -8
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi i32 [ 1, %44 ], [ %80, %46 ]
  %48 = phi i32 [ 0, %44 ], [ %81, %46 ]
  %49 = add nsw i32 %47, %39
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  store float 0.000000e+00, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = add nuw nsw i32 %47, 1
  %53 = add nsw i32 %52, %39
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  store float 0.000000e+00, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = add nuw nsw i32 %47, 2
  %57 = add nsw i32 %56, %39
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  store float 0.000000e+00, float addrspace(1)* %59, align 4, !tbaa !7
  %60 = add nuw nsw i32 %47, 3
  %61 = add nsw i32 %60, %39
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  store float 0.000000e+00, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = add nuw nsw i32 %47, 4
  %65 = add nsw i32 %64, %39
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  store float 0.000000e+00, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = add nuw nsw i32 %47, 5
  %69 = add nsw i32 %68, %39
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  store float 0.000000e+00, float addrspace(1)* %71, align 4, !tbaa !7
  %72 = add nuw nsw i32 %47, 6
  %73 = add nsw i32 %72, %39
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  store float 0.000000e+00, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = add nuw nsw i32 %47, 7
  %77 = add nsw i32 %76, %39
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  store float 0.000000e+00, float addrspace(1)* %79, align 4, !tbaa !7
  %80 = add nuw nsw i32 %47, 8
  %81 = add i32 %48, 8
  %82 = icmp eq i32 %81, %45
  br i1 %82, label %83, label %46, !llvm.loop !11

83:                                               ; preds = %46, %38
  %84 = phi i32 [ 1, %38 ], [ %80, %46 ]
  %85 = icmp eq i32 %42, 0
  br i1 %85, label %95, label %86

86:                                               ; preds = %83, %86
  %87 = phi i32 [ %92, %86 ], [ %84, %83 ]
  %88 = phi i32 [ %93, %86 ], [ 0, %83 ]
  %89 = add nsw i32 %87, %39
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  store float 0.000000e+00, float addrspace(1)* %91, align 4, !tbaa !7
  %92 = add nuw nsw i32 %87, 1
  %93 = add i32 %88, 1
  %94 = icmp eq i32 %93, %42
  br i1 %94, label %95, label %86, !llvm.loop !13

95:                                               ; preds = %83, %86, %32, %3
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
