; ModuleID = '../data/hip_kernels/14408/11/main.cu'
source_filename = "../data/hip_kernels/14408/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata_a = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18computeSumPerBlockPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = icmp ult i32 %11, %1
  br i1 %12, label %13, label %79

13:                                               ; preds = %2
  %14 = zext i32 %11 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %3
  store i32 %16, i32 addrspace(3)* %17, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp eq i32 %3, 0
  br i1 %18, label %19, label %79

19:                                               ; preds = %13
  %20 = and i32 %9, 7
  %21 = icmp ult i16 %8, 8
  br i1 %21, label %62, label %22

22:                                               ; preds = %19
  %23 = and i32 %9, 2040
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 0, %22 ], [ %59, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %58, %24 ]
  %27 = phi i32 [ 0, %22 ], [ %60, %24 ]
  %28 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %25
  %29 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !7
  %30 = add nsw i32 %29, %26
  %31 = or i32 %25, 1
  %32 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %31
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !7
  %34 = add nsw i32 %33, %30
  %35 = or i32 %25, 2
  %36 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %35
  %37 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !7
  %38 = add nsw i32 %37, %34
  %39 = or i32 %25, 3
  %40 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %39
  %41 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !7
  %42 = add nsw i32 %41, %38
  %43 = or i32 %25, 4
  %44 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %43
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !7
  %46 = add nsw i32 %45, %42
  %47 = or i32 %25, 5
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %47
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %49, %46
  %51 = or i32 %25, 6
  %52 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %51
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !7
  %54 = add nsw i32 %53, %50
  %55 = or i32 %25, 7
  %56 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %55
  %57 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !7
  %58 = add nsw i32 %57, %54
  %59 = add nuw nsw i32 %25, 8
  %60 = add i32 %27, 8
  %61 = icmp eq i32 %60, %23
  br i1 %61, label %62, label %24, !llvm.loop !11

62:                                               ; preds = %24, %19
  %63 = phi i32 [ undef, %19 ], [ %58, %24 ]
  %64 = phi i32 [ 0, %19 ], [ %59, %24 ]
  %65 = phi i32 [ 0, %19 ], [ %58, %24 ]
  %66 = icmp eq i32 %20, 0
  br i1 %66, label %77, label %67

67:                                               ; preds = %62, %67
  %68 = phi i32 [ %74, %67 ], [ %64, %62 ]
  %69 = phi i32 [ %73, %67 ], [ %65, %62 ]
  %70 = phi i32 [ %75, %67 ], [ 0, %62 ]
  %71 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata_a, i32 0, i32 %68
  %72 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !7
  %73 = add nsw i32 %72, %69
  %74 = add nuw nsw i32 %68, 1
  %75 = add i32 %70, 1
  %76 = icmp eq i32 %75, %20
  br i1 %76, label %77, label %67, !llvm.loop !13

77:                                               ; preds = %67, %62
  %78 = phi i32 [ %63, %62 ], [ %73, %67 ]
  store i32 %78, i32 addrspace(1)* %15, align 4, !tbaa !7
  br label %79

79:                                               ; preds = %13, %77, %2
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
