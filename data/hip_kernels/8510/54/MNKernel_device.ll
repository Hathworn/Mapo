; ModuleID = '../data/hip_kernels/8510/54/main.cu'
source_filename = "../data/hip_kernels/8510/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8MNKerneliPlS_S_i(i32 %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp sgt i32 %4, 0
  %24 = mul nsw i32 %22, %4
  br i1 %23, label %25, label %47

25:                                               ; preds = %5
  %26 = and i32 %4, 1
  %27 = icmp eq i32 %4, 1
  br i1 %27, label %30, label %28

28:                                               ; preds = %25
  %29 = and i32 %4, -2
  br label %52

30:                                               ; preds = %52, %25
  %31 = phi i64 [ undef, %25 ], [ %78, %52 ]
  %32 = phi i32 [ 0, %25 ], [ %79, %52 ]
  %33 = phi i64 [ 0, %25 ], [ %78, %52 ]
  %34 = icmp eq i32 %26, 0
  br i1 %34, label %47, label %35

35:                                               ; preds = %30
  %36 = add nsw i32 %32, %24
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %37
  %39 = load i64, i64 addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !5
  %40 = mul nsw i32 %32, %4
  %41 = add nsw i32 %40, %14
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %42
  %44 = load i64, i64 addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !5
  %45 = mul nsw i64 %44, %39
  %46 = add nsw i64 %45, %33
  br label %47

47:                                               ; preds = %35, %30, %5
  %48 = phi i64 [ 0, %5 ], [ %31, %30 ], [ %46, %35 ]
  %49 = add nsw i32 %24, %14
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %50
  store i64 %48, i64 addrspace(1)* %51, align 8, !tbaa !7
  ret void

52:                                               ; preds = %52, %28
  %53 = phi i32 [ 0, %28 ], [ %79, %52 ]
  %54 = phi i64 [ 0, %28 ], [ %78, %52 ]
  %55 = phi i32 [ 0, %28 ], [ %80, %52 ]
  %56 = add nsw i32 %53, %24
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %57
  %59 = load i64, i64 addrspace(1)* %58, align 8, !tbaa !7, !amdgpu.noclobber !5
  %60 = mul nsw i32 %53, %4
  %61 = add nsw i32 %60, %14
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %62
  %64 = load i64, i64 addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = mul nsw i64 %64, %59
  %66 = add nsw i64 %65, %54
  %67 = or i32 %53, 1
  %68 = add nsw i32 %67, %24
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %69
  %71 = load i64, i64 addrspace(1)* %70, align 8, !tbaa !7, !amdgpu.noclobber !5
  %72 = mul nsw i32 %67, %4
  %73 = add nsw i32 %72, %14
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %74
  %76 = load i64, i64 addrspace(1)* %75, align 8, !tbaa !7, !amdgpu.noclobber !5
  %77 = mul nsw i64 %76, %71
  %78 = add nsw i64 %77, %66
  %79 = add nuw nsw i32 %53, 2
  %80 = add i32 %55, 2
  %81 = icmp eq i32 %80, %29
  br i1 %81, label %30, label %52, !llvm.loop !11
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
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
