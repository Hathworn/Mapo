; ModuleID = '../data/hip_kernels/5324/1/main.cu'
source_filename = "../data/hip_kernels/5324/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16propagateCarriesPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = mul i32 %10, %1
  %12 = add i32 %9, %11
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %14, label %39

14:                                               ; preds = %2
  %15 = and i32 %1, 3
  %16 = icmp ult i32 %1, 4
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = and i32 %1, -4
  br label %40

19:                                               ; preds = %40, %14
  %20 = phi i32 [ %1, %14 ], [ %74, %40 ]
  %21 = phi i32 [ 0, %14 ], [ %81, %40 ]
  %22 = icmp eq i32 %15, 0
  br i1 %22, label %39, label %23

23:                                               ; preds = %19, %23
  %24 = phi i32 [ %27, %23 ], [ %20, %19 ]
  %25 = phi i32 [ %34, %23 ], [ %21, %19 ]
  %26 = phi i32 [ %37, %23 ], [ 0, %19 ]
  %27 = add nsw i32 %24, -1
  %28 = add nsw i32 %12, %27
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %32 = add nsw i32 %31, %25
  %33 = freeze i32 %32
  %34 = sdiv i32 %33, 10
  %35 = mul i32 %34, 10
  %36 = sub i32 %33, %35
  store i32 %36, i32 addrspace(1)* %30, align 4, !tbaa !7
  %37 = add i32 %26, 1
  %38 = icmp eq i32 %37, %15
  br i1 %38, label %39, label %23, !llvm.loop !11

39:                                               ; preds = %19, %23, %2
  ret void

40:                                               ; preds = %40, %17
  %41 = phi i32 [ %1, %17 ], [ %74, %40 ]
  %42 = phi i32 [ 0, %17 ], [ %81, %40 ]
  %43 = phi i32 [ 0, %17 ], [ %84, %40 ]
  %44 = add nsw i32 %41, -1
  %45 = add nsw i32 %12, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = add nsw i32 %48, %42
  %50 = freeze i32 %49
  %51 = sdiv i32 %50, 10
  %52 = mul i32 %51, 10
  %53 = sub i32 %50, %52
  store i32 %53, i32 addrspace(1)* %47, align 4, !tbaa !7
  %54 = add nsw i32 %41, -2
  %55 = add nsw i32 %12, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  %59 = add nsw i32 %58, %51
  %60 = freeze i32 %59
  %61 = sdiv i32 %60, 10
  %62 = mul i32 %61, 10
  %63 = sub i32 %60, %62
  store i32 %63, i32 addrspace(1)* %57, align 4, !tbaa !7
  %64 = add nsw i32 %41, -3
  %65 = add nsw i32 %12, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7
  %69 = add nsw i32 %68, %61
  %70 = freeze i32 %69
  %71 = sdiv i32 %70, 10
  %72 = mul i32 %71, 10
  %73 = sub i32 %70, %72
  store i32 %73, i32 addrspace(1)* %67, align 4, !tbaa !7
  %74 = add nsw i32 %41, -4
  %75 = add nsw i32 %12, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7
  %79 = add nsw i32 %78, %71
  %80 = freeze i32 %79
  %81 = sdiv i32 %80, 10
  %82 = mul i32 %81, 10
  %83 = sub i32 %80, %82
  store i32 %83, i32 addrspace(1)* %77, align 4, !tbaa !7
  %84 = add i32 %43, 4
  %85 = icmp eq i32 %84, %18
  br i1 %85, label %19, label %40, !llvm.loop !13
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
