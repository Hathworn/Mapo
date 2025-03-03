; ModuleID = '../data/hip_kernels/4149/2/main.cu'
source_filename = "../data/hip_kernels/4149/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z16gpu_rndwr_kernelPimmm(i32 addrspace(1)* nocapture writeonly %0, i64 %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = icmp eq i64 %1, 0
  br i1 %5, label %82, label %6

6:                                                ; preds = %4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %10, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = icmp ult i64 %16, %3
  %18 = lshr i64 %16, 5
  %19 = add nuw nsw i64 %18, 24819
  %20 = icmp eq i64 %2, 0
  br i1 %17, label %21, label %82

21:                                               ; preds = %6
  %22 = and i64 %2, 3
  %23 = icmp ult i64 %2, 4
  %24 = and i64 %2, -4
  %25 = icmp eq i64 %22, 0
  br label %26

26:                                               ; preds = %21, %79
  %27 = phi i64 [ %80, %79 ], [ 0, %21 ]
  br i1 %20, label %79, label %28

28:                                               ; preds = %26
  br i1 %23, label %63, label %29

29:                                               ; preds = %28, %29
  %30 = phi i64 [ %58, %29 ], [ %19, %28 ]
  %31 = phi i64 [ %56, %29 ], [ %16, %28 ]
  %32 = phi i64 [ %61, %29 ], [ 0, %28 ]
  %33 = shl i64 %30, 5
  %34 = add i64 %33, %31
  %35 = urem i64 %34, %3
  %36 = add i64 %30, 548191
  %37 = urem i64 %36, %3
  %38 = trunc i64 %35 to i32
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  store i32 %38, i32 addrspace(1)* %39, align 4, !tbaa !7
  %40 = shl i64 %37, 5
  %41 = add i64 %40, %35
  %42 = urem i64 %41, %3
  %43 = add i64 %37, 548191
  %44 = urem i64 %43, %3
  %45 = trunc i64 %42 to i32
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  store i32 %45, i32 addrspace(1)* %46, align 4, !tbaa !7
  %47 = shl i64 %44, 5
  %48 = add i64 %47, %42
  %49 = urem i64 %48, %3
  %50 = add i64 %44, 548191
  %51 = urem i64 %50, %3
  %52 = trunc i64 %49 to i32
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  store i32 %52, i32 addrspace(1)* %53, align 4, !tbaa !7
  %54 = shl i64 %51, 5
  %55 = add i64 %54, %49
  %56 = urem i64 %55, %3
  %57 = add i64 %51, 548191
  %58 = urem i64 %57, %3
  %59 = trunc i64 %56 to i32
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  store i32 %59, i32 addrspace(1)* %60, align 4, !tbaa !7
  %61 = add i64 %32, 4
  %62 = icmp eq i64 %61, %24
  br i1 %62, label %63, label %29, !llvm.loop !11

63:                                               ; preds = %29, %28
  %64 = phi i64 [ %19, %28 ], [ %58, %29 ]
  %65 = phi i64 [ %16, %28 ], [ %56, %29 ]
  br i1 %25, label %79, label %66

66:                                               ; preds = %63, %66
  %67 = phi i64 [ %74, %66 ], [ %64, %63 ]
  %68 = phi i64 [ %72, %66 ], [ %65, %63 ]
  %69 = phi i64 [ %77, %66 ], [ 0, %63 ]
  %70 = shl i64 %67, 5
  %71 = add i64 %70, %68
  %72 = urem i64 %71, %3
  %73 = add i64 %67, 548191
  %74 = urem i64 %73, %3
  %75 = trunc i64 %72 to i32
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  store i32 %75, i32 addrspace(1)* %76, align 4, !tbaa !7
  %77 = add i64 %69, 1
  %78 = icmp eq i64 %77, %22
  br i1 %78, label %79, label %66, !llvm.loop !13

79:                                               ; preds = %63, %66, %26
  %80 = add nuw i64 %27, 1
  %81 = icmp eq i64 %80, %1
  br i1 %81, label %82, label %26, !llvm.loop !15

82:                                               ; preds = %79, %6, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
