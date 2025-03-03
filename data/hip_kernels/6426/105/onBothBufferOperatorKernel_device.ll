; ModuleID = '../data/hip_kernels/6426/105/main.cu'
source_filename = "../data/hip_kernels/6426/105/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26onBothBufferOperatorKerneliiiiiPKjiiiiS0_iiiiPj(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 addrspace(1)* nocapture readonly %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 addrspace(1)* nocapture writeonly %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %17, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 2, !range !4, !invariant.load !5
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %33 = add i32 %31, %32
  %34 = icmp slt i32 %25, %13
  %35 = icmp slt i32 %33, %14
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %83

37:                                               ; preds = %16
  %38 = add nsw i32 %33, %12
  %39 = add i32 %11, %0
  %40 = add i32 %39, %25
  %41 = sub nsw i32 %40, %1
  %42 = srem i32 %41, %0
  %43 = sub nsw i32 %38, %2
  %44 = sub nsw i32 %40, %6
  %45 = srem i32 %44, %0
  %46 = sub nsw i32 %38, %7
  %47 = icmp sgt i32 %45, -1
  br i1 %47, label %48, label %77

48:                                               ; preds = %37
  %49 = icmp slt i32 %45, %8
  %50 = icmp sgt i32 %46, -1
  %51 = select i1 %49, i1 %50, i1 false
  br i1 %51, label %52, label %77

52:                                               ; preds = %48
  %53 = icmp slt i32 %46, %9
  %54 = icmp sgt i32 %42, -1
  %55 = select i1 %53, i1 %54, i1 false
  br i1 %55, label %56, label %77

56:                                               ; preds = %52
  %57 = icmp slt i32 %42, %3
  %58 = icmp sgt i32 %43, -1
  %59 = select i1 %57, i1 %58, i1 false
  %60 = icmp slt i32 %43, %4
  %61 = select i1 %59, i1 %60, i1 false
  br i1 %61, label %62, label %77

62:                                               ; preds = %56
  %63 = mul nsw i32 %43, %3
  %64 = add nsw i32 %42, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %76, label %69

69:                                               ; preds = %62
  %70 = mul nsw i32 %46, %8
  %71 = add nsw i32 %45, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %77

76:                                               ; preds = %69, %62
  br label %77

77:                                               ; preds = %69, %76, %56, %52, %48, %37
  %78 = phi i32 [ 0, %76 ], [ 0, %56 ], [ 0, %52 ], [ 0, %48 ], [ 0, %37 ], [ 1, %69 ]
  %79 = mul nsw i32 %33, %13
  %80 = add nsw i32 %79, %25
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %81
  store i32 %78, i32 addrspace(1)* %82, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %77, %16
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
