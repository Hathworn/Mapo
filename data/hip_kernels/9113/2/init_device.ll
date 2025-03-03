; ModuleID = '../data/hip_kernels/9113/2/main.cu'
source_filename = "../data/hip_kernels/9113/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4initPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp slt i32 %1, 2
  br i1 %4, label %81, label %5

5:                                                ; preds = %3
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = add i32 %1, -1
  %12 = and i32 %11, 1
  %13 = icmp eq i32 %1, 2
  br i1 %13, label %59, label %14

14:                                               ; preds = %5
  %15 = and i32 %11, -2
  br label %16

16:                                               ; preds = %56, %14
  %17 = phi i32 [ 2, %14 ], [ %42, %56 ]
  %18 = phi i32 [ 0, %14 ], [ %57, %56 ]
  %19 = zext i32 %17 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !4
  %22 = icmp eq i32 %21, 0
  %23 = or i32 %17, 1
  br i1 %22, label %24, label %37

24:                                               ; preds = %16
  %25 = add nuw i32 %23, %6
  %26 = load i16, i16 addrspace(4)* %10, align 4, !range !8, !invariant.load !9
  %27 = zext i16 %26 to i32
  %28 = mul i32 %7, %27
  %29 = add i32 %25, %28
  %30 = icmp slt i32 %29, %2
  br i1 %30, label %31, label %37

31:                                               ; preds = %24
  %32 = srem i32 %29, %17
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %37

34:                                               ; preds = %31
  %35 = sext i32 %29 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  store i32 1, i32 addrspace(1)* %36, align 4, !tbaa !4
  br label %37

37:                                               ; preds = %16, %24, %34, %31
  %38 = zext i32 %23 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !4
  %41 = icmp eq i32 %40, 0
  %42 = add nuw i32 %17, 2
  br i1 %41, label %43, label %56

43:                                               ; preds = %37
  %44 = add nuw i32 %42, %6
  %45 = load i16, i16 addrspace(4)* %10, align 4, !range !8, !invariant.load !9
  %46 = zext i16 %45 to i32
  %47 = mul i32 %7, %46
  %48 = add i32 %44, %47
  %49 = icmp slt i32 %48, %2
  br i1 %49, label %50, label %56

50:                                               ; preds = %43
  %51 = srem i32 %48, %23
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %56

53:                                               ; preds = %50
  %54 = sext i32 %48 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  store i32 1, i32 addrspace(1)* %55, align 4, !tbaa !4
  br label %56

56:                                               ; preds = %53, %50, %43, %37
  %57 = add i32 %18, 2
  %58 = icmp eq i32 %57, %15
  br i1 %58, label %59, label %16, !llvm.loop !10

59:                                               ; preds = %56, %5
  %60 = phi i32 [ 2, %5 ], [ %42, %56 ]
  %61 = icmp eq i32 %12, 0
  br i1 %61, label %81, label %62

62:                                               ; preds = %59
  %63 = zext i32 %60 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !4
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %81

67:                                               ; preds = %62
  %68 = add nuw i32 %60, 1
  %69 = add nuw i32 %68, %6
  %70 = load i16, i16 addrspace(4)* %10, align 4, !range !8, !invariant.load !9
  %71 = zext i16 %70 to i32
  %72 = mul i32 %7, %71
  %73 = add i32 %69, %72
  %74 = icmp slt i32 %73, %2
  br i1 %74, label %75, label %81

75:                                               ; preds = %67
  %76 = srem i32 %73, %60
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %81

78:                                               ; preds = %75
  %79 = sext i32 %73 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  store i32 1, i32 addrspace(1)* %80, align 4, !tbaa !4
  br label %81

81:                                               ; preds = %59, %78, %75, %67, %62, %3
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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i16 1, i16 1025}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
