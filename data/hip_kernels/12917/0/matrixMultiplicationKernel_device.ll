; ModuleID = '../data/hip_kernels/12917/0/main.cu'
source_filename = "../data/hip_kernels/12917/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26matrixMultiplicationKernelPlS_S_l(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture writeonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = zext i32 %13 to i64
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = zext i32 %22 to i64
  %24 = icmp slt i64 %14, %3
  %25 = icmp slt i64 %23, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %80

27:                                               ; preds = %4
  %28 = icmp sgt i64 %3, 0
  %29 = mul nsw i64 %14, %3
  br i1 %28, label %30, label %50

30:                                               ; preds = %27
  %31 = and i64 %3, 1
  %32 = icmp eq i64 %3, 1
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = and i64 %3, -2
  br label %54

35:                                               ; preds = %54, %30
  %36 = phi i64 [ undef, %30 ], [ %76, %54 ]
  %37 = phi i64 [ 0, %30 ], [ %77, %54 ]
  %38 = phi i64 [ 0, %30 ], [ %76, %54 ]
  %39 = icmp eq i64 %31, 0
  br i1 %39, label %50, label %40

40:                                               ; preds = %35
  %41 = add nsw i64 %37, %29
  %42 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %41
  %43 = load i64, i64 addrspace(1)* %42, align 8, !tbaa !7, !amdgpu.noclobber !5
  %44 = mul nsw i64 %37, %3
  %45 = add nsw i64 %44, %23
  %46 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %45
  %47 = load i64, i64 addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !5
  %48 = mul nsw i64 %47, %43
  %49 = add nsw i64 %48, %38
  br label %50

50:                                               ; preds = %40, %35, %27
  %51 = phi i64 [ 0, %27 ], [ %36, %35 ], [ %49, %40 ]
  %52 = add nsw i64 %29, %23
  %53 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %52
  store i64 %51, i64 addrspace(1)* %53, align 8, !tbaa !7
  br label %80

54:                                               ; preds = %54, %33
  %55 = phi i64 [ 0, %33 ], [ %77, %54 ]
  %56 = phi i64 [ 0, %33 ], [ %76, %54 ]
  %57 = phi i64 [ 0, %33 ], [ %78, %54 ]
  %58 = add nsw i64 %55, %29
  %59 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %58
  %60 = load i64, i64 addrspace(1)* %59, align 8, !tbaa !7, !amdgpu.noclobber !5
  %61 = mul nsw i64 %55, %3
  %62 = add nsw i64 %61, %23
  %63 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %62
  %64 = load i64, i64 addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = mul nsw i64 %64, %60
  %66 = add nsw i64 %65, %56
  %67 = or i64 %55, 1
  %68 = add nsw i64 %67, %29
  %69 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %68
  %70 = load i64, i64 addrspace(1)* %69, align 8, !tbaa !7, !amdgpu.noclobber !5
  %71 = mul nsw i64 %67, %3
  %72 = add nsw i64 %71, %23
  %73 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %72
  %74 = load i64, i64 addrspace(1)* %73, align 8, !tbaa !7, !amdgpu.noclobber !5
  %75 = mul nsw i64 %74, %70
  %76 = add nsw i64 %75, %66
  %77 = add nuw nsw i64 %55, 2
  %78 = add i64 %57, 2
  %79 = icmp eq i64 %78, %34
  br i1 %79, label %35, label %54, !llvm.loop !11

80:                                               ; preds = %50, %4
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
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
