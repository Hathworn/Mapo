; ModuleID = '../data/hip_kernels/13236/4/main.cu'
source_filename = "../data/hip_kernels/13236/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27imperviousness_change_largePKhS0_jjPii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = zext i16 %12 to i64
  %15 = zext i32 %13 to i64
  %16 = mul nuw nsw i64 %14, %15
  %17 = add nuw nsw i64 %16, %8
  %18 = sext i32 %5 to i64
  %19 = mul i64 %17, %18
  %20 = mul i64 %16, %18
  %21 = mul i32 %3, %2
  %22 = zext i32 %21 to i64
  %23 = icmp ult i64 %20, %22
  %24 = icmp sgt i32 %5, 0
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %109

26:                                               ; preds = %6
  %27 = and i64 %18, 3
  %28 = icmp ult i32 %5, 4
  br i1 %28, label %88, label %29

29:                                               ; preds = %26
  %30 = and i64 %18, -4
  br label %31

31:                                               ; preds = %84, %29
  %32 = phi i64 [ 0, %29 ], [ %85, %84 ]
  %33 = phi i64 [ 0, %29 ], [ %86, %84 ]
  %34 = add i64 %32, %19
  %35 = icmp ult i64 %34, %22
  br i1 %35, label %36, label %45

36:                                               ; preds = %31
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %34
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7
  %39 = zext i8 %38 to i32
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %34
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7
  %42 = zext i8 %41 to i32
  %43 = sub nsw i32 %39, %42
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %34
  store i32 %43, i32 addrspace(1)* %44, align 4, !tbaa !10
  br label %45

45:                                               ; preds = %31, %36
  %46 = or i64 %32, 1
  %47 = add i64 %46, %19
  %48 = icmp ult i64 %47, %22
  br i1 %48, label %49, label %58

49:                                               ; preds = %45
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %47
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7
  %52 = zext i8 %51 to i32
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %47
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !7
  %55 = zext i8 %54 to i32
  %56 = sub nsw i32 %52, %55
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  store i32 %56, i32 addrspace(1)* %57, align 4, !tbaa !10
  br label %58

58:                                               ; preds = %49, %45
  %59 = or i64 %32, 2
  %60 = add i64 %59, %19
  %61 = icmp ult i64 %60, %22
  br i1 %61, label %62, label %71

62:                                               ; preds = %58
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %60
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !7
  %65 = zext i8 %64 to i32
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %60
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !7
  %68 = zext i8 %67 to i32
  %69 = sub nsw i32 %65, %68
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  store i32 %69, i32 addrspace(1)* %70, align 4, !tbaa !10
  br label %71

71:                                               ; preds = %62, %58
  %72 = or i64 %32, 3
  %73 = add i64 %72, %19
  %74 = icmp ult i64 %73, %22
  br i1 %74, label %75, label %84

75:                                               ; preds = %71
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %73
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7
  %78 = zext i8 %77 to i32
  %79 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  %80 = load i8, i8 addrspace(1)* %79, align 1, !tbaa !7
  %81 = zext i8 %80 to i32
  %82 = sub nsw i32 %78, %81
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %73
  store i32 %82, i32 addrspace(1)* %83, align 4, !tbaa !10
  br label %84

84:                                               ; preds = %75, %71
  %85 = add nuw nsw i64 %32, 4
  %86 = add i64 %33, 4
  %87 = icmp eq i64 %86, %30
  br i1 %87, label %88, label %31, !llvm.loop !12

88:                                               ; preds = %84, %26
  %89 = phi i64 [ 0, %26 ], [ %85, %84 ]
  %90 = icmp eq i64 %27, 0
  br i1 %90, label %109, label %91

91:                                               ; preds = %88, %105
  %92 = phi i64 [ %106, %105 ], [ %89, %88 ]
  %93 = phi i64 [ %107, %105 ], [ 0, %88 ]
  %94 = add i64 %92, %19
  %95 = icmp ult i64 %94, %22
  br i1 %95, label %96, label %105

96:                                               ; preds = %91
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %94
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !7
  %99 = zext i8 %98 to i32
  %100 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %94
  %101 = load i8, i8 addrspace(1)* %100, align 1, !tbaa !7
  %102 = zext i8 %101 to i32
  %103 = sub nsw i32 %99, %102
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %94
  store i32 %103, i32 addrspace(1)* %104, align 4, !tbaa !10
  br label %105

105:                                              ; preds = %96, %91
  %106 = add nuw nsw i64 %92, 1
  %107 = add i64 %93, 1
  %108 = icmp eq i64 %107, %27
  br i1 %108, label %109, label %91, !llvm.loop !14

109:                                              ; preds = %88, %105, %6
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
