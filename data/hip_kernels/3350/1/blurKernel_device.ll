; ModuleID = '../data/hip_kernels/3350/1/main.cu'
source_filename = "../data/hip_kernels/3350/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10blurKernelPhS_iii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %2
  %24 = icmp slt i32 %14, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %72

26:                                               ; preds = %5
  %27 = sub i32 0, %4
  %28 = icmp slt i32 %4, 0
  br i1 %28, label %40, label %29

29:                                               ; preds = %26, %46
  %30 = phi i32 [ %69, %46 ], [ 0, %26 ]
  %31 = phi i32 [ %68, %46 ], [ 0, %26 ]
  %32 = phi i32 [ %47, %46 ], [ %27, %26 ]
  %33 = add nsw i32 %32, %14
  %34 = icmp sgt i32 %33, -1
  %35 = icmp slt i32 %33, %3
  %36 = mul nsw i32 %33, %2
  br label %49

37:                                               ; preds = %46
  %38 = sdiv i32 %69, %68
  %39 = trunc i32 %38 to i8
  br label %40

40:                                               ; preds = %37, %26
  %41 = phi i8 [ %39, %37 ], [ poison, %26 ]
  %42 = mul nsw i32 %14, %2
  %43 = add nsw i32 %42, %22
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %44
  store i8 %41, i8 addrspace(1)* %45, align 1, !tbaa !7
  br label %72

46:                                               ; preds = %67
  %47 = add i32 %32, 1
  %48 = icmp eq i32 %32, %4
  br i1 %48, label %37, label %29, !llvm.loop !10

49:                                               ; preds = %29, %67
  %50 = phi i32 [ %30, %29 ], [ %69, %67 ]
  %51 = phi i32 [ %31, %29 ], [ %68, %67 ]
  %52 = phi i32 [ %27, %29 ], [ %70, %67 ]
  %53 = add nsw i32 %52, %22
  br i1 %34, label %54, label %67

54:                                               ; preds = %49
  %55 = icmp sgt i32 %53, -1
  %56 = select i1 %35, i1 %55, i1 false
  %57 = icmp slt i32 %53, %2
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %67

59:                                               ; preds = %54
  %60 = add nsw i32 %53, %36
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !7, !amdgpu.noclobber !5
  %64 = zext i8 %63 to i32
  %65 = add nsw i32 %50, %64
  %66 = add nsw i32 %51, 1
  br label %67

67:                                               ; preds = %59, %54, %49
  %68 = phi i32 [ %66, %59 ], [ %51, %54 ], [ %51, %49 ]
  %69 = phi i32 [ %65, %59 ], [ %50, %54 ], [ %50, %49 ]
  %70 = add i32 %52, 1
  %71 = icmp eq i32 %52, %4
  br i1 %71, label %46, label %49, !llvm.loop !12

72:                                               ; preds = %40, %5
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
