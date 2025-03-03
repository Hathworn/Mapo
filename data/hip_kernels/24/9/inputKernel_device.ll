; ModuleID = '../data/hip_kernels/24/9/main.cu'
source_filename = "../data/hip_kernels/24/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z11inputKernelPfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
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
  br i1 %23, label %24, label %92

24:                                               ; preds = %3
  %25 = icmp slt i32 %22, %1
  br i1 %25, label %26, label %29

26:                                               ; preds = %24
  %27 = sitofp i32 %22 to float
  %28 = mul nsw i32 %22, %2
  br label %29

29:                                               ; preds = %24, %26
  %30 = phi i32 [ %28, %26 ], [ %22, %24 ]
  %31 = phi float [ %27, %26 ], [ 0.000000e+00, %24 ]
  %32 = sext i32 %30 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  store float %31, float addrspace(1)* %33, align 4, !tbaa !7
  %34 = icmp sgt i32 %2, 1
  br i1 %34, label %35, label %92

35:                                               ; preds = %29
  %36 = mul nsw i32 %22, %2
  %37 = add i32 %2, -1
  %38 = add i32 %2, -2
  %39 = and i32 %37, 7
  %40 = icmp ult i32 %38, 7
  br i1 %40, label %80, label %41

41:                                               ; preds = %35
  %42 = and i32 %37, -8
  br label %43

43:                                               ; preds = %43, %41
  %44 = phi i32 [ 1, %41 ], [ %77, %43 ]
  %45 = phi i32 [ 0, %41 ], [ %78, %43 ]
  %46 = add nsw i32 %44, %36
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  store float 0.000000e+00, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = add nuw nsw i32 %44, 1
  %50 = add nsw i32 %49, %36
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  store float 0.000000e+00, float addrspace(1)* %52, align 4, !tbaa !7
  %53 = add nuw nsw i32 %44, 2
  %54 = add nsw i32 %53, %36
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  store float 0.000000e+00, float addrspace(1)* %56, align 4, !tbaa !7
  %57 = add nuw nsw i32 %44, 3
  %58 = add nsw i32 %57, %36
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  store float 0.000000e+00, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = add nuw nsw i32 %44, 4
  %62 = add nsw i32 %61, %36
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  store float 0.000000e+00, float addrspace(1)* %64, align 4, !tbaa !7
  %65 = add nuw nsw i32 %44, 5
  %66 = add nsw i32 %65, %36
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  store float 0.000000e+00, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = add nuw nsw i32 %44, 6
  %70 = add nsw i32 %69, %36
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float 0.000000e+00, float addrspace(1)* %72, align 4, !tbaa !7
  %73 = add nuw nsw i32 %44, 7
  %74 = add nsw i32 %73, %36
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  store float 0.000000e+00, float addrspace(1)* %76, align 4, !tbaa !7
  %77 = add nuw nsw i32 %44, 8
  %78 = add i32 %45, 8
  %79 = icmp eq i32 %78, %42
  br i1 %79, label %80, label %43, !llvm.loop !11

80:                                               ; preds = %43, %35
  %81 = phi i32 [ 1, %35 ], [ %77, %43 ]
  %82 = icmp eq i32 %39, 0
  br i1 %82, label %92, label %83

83:                                               ; preds = %80, %83
  %84 = phi i32 [ %89, %83 ], [ %81, %80 ]
  %85 = phi i32 [ %90, %83 ], [ 0, %80 ]
  %86 = add nsw i32 %84, %36
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float 0.000000e+00, float addrspace(1)* %88, align 4, !tbaa !7
  %89 = add nuw nsw i32 %84, 1
  %90 = add i32 %85, 1
  %91 = icmp eq i32 %90, %39
  br i1 %91, label %92, label %83, !llvm.loop !13

92:                                               ; preds = %80, %83, %29, %3
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
