; ModuleID = '../data/hip_kernels/15719/4/main.cu'
source_filename = "../data/hip_kernels/15719/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15avg_vote_kernelPfS_Piiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul nsw i32 %6, %5
  %18 = sdiv i32 %3, 2
  %19 = mul nsw i32 %17, %4
  %20 = icmp slt i32 %16, %19
  br i1 %20, label %21, label %103

21:                                               ; preds = %7
  %22 = freeze i32 %16
  %23 = freeze i32 %17
  %24 = sdiv i32 %22, %23
  %25 = mul i32 %24, %23
  %26 = sub i32 %22, %25
  %27 = freeze i32 %6
  %28 = sdiv i32 %26, %27
  %29 = mul i32 %28, %27
  %30 = sub i32 %26, %29
  %31 = sub nsw i32 0, %18
  %32 = icmp slt i32 %3, -1
  br i1 %32, label %43, label %33

33:                                               ; preds = %21
  %34 = mul nsw i32 %24, %17
  %35 = tail call i32 @llvm.abs.i32(i32 %18, i1 true)
  br label %36

36:                                               ; preds = %33, %47
  %37 = phi double [ 0.000000e+00, %33 ], [ %92, %47 ]
  %38 = phi i32 [ 0, %33 ], [ %91, %47 ]
  %39 = phi i32 [ %31, %33 ], [ %48, %47 ]
  %40 = add nsw i32 %39, %30
  %41 = icmp sgt i32 %40, -1
  %42 = icmp slt i32 %40, %6
  br label %50

43:                                               ; preds = %47, %21
  %44 = phi i32 [ 0, %21 ], [ %91, %47 ]
  %45 = phi double [ 0.000000e+00, %21 ], [ %92, %47 ]
  %46 = icmp eq i32 %44, 0
  br i1 %46, label %103, label %95

47:                                               ; preds = %90
  %48 = add i32 %39, 1
  %49 = icmp eq i32 %39, %35
  br i1 %49, label %43, label %36, !llvm.loop !7

50:                                               ; preds = %36, %90
  %51 = phi double [ %37, %36 ], [ %92, %90 ]
  %52 = phi i32 [ %38, %36 ], [ %91, %90 ]
  %53 = phi i32 [ %31, %36 ], [ %93, %90 ]
  %54 = add nsw i32 %53, %28
  br i1 %41, label %55, label %90

55:                                               ; preds = %50
  %56 = icmp sgt i32 %54, -1
  %57 = select i1 %42, i1 %56, i1 false
  %58 = icmp slt i32 %54, %5
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %60, label %90

60:                                               ; preds = %55
  %61 = mul nsw i32 %54, %6
  %62 = add nsw i32 %61, %40
  %63 = shl nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !9, !amdgpu.noclobber !5
  %67 = add nuw nsw i32 %63, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !9, !amdgpu.noclobber !5
  %71 = sub nsw i32 %66, %39
  %72 = sub nsw i32 %70, %53
  %73 = icmp sgt i32 %71, -1
  br i1 %73, label %74, label %90

74:                                               ; preds = %60
  %75 = icmp slt i32 %71, %6
  %76 = icmp sgt i32 %72, -1
  %77 = select i1 %75, i1 %76, i1 false
  %78 = icmp slt i32 %72, %5
  %79 = select i1 %77, i1 %78, i1 false
  br i1 %79, label %80, label %90

80:                                               ; preds = %74
  %81 = mul nsw i32 %72, %6
  %82 = add i32 %71, %34
  %83 = add i32 %82, %81
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !13, !amdgpu.noclobber !5
  %87 = fpext float %86 to double
  %88 = fadd contract double %51, %87
  %89 = add nsw i32 %52, 1
  br label %90

90:                                               ; preds = %60, %74, %80, %55, %50
  %91 = phi i32 [ %52, %55 ], [ %52, %50 ], [ %89, %80 ], [ %52, %74 ], [ %52, %60 ]
  %92 = phi double [ %51, %55 ], [ %51, %50 ], [ %88, %80 ], [ %51, %74 ], [ %51, %60 ]
  %93 = add i32 %53, 1
  %94 = icmp eq i32 %53, %35
  br i1 %94, label %47, label %50, !llvm.loop !15

95:                                               ; preds = %43
  %96 = sitofp i32 %44 to double
  %97 = fdiv contract double %45, %96
  %98 = fptrunc double %97 to float
  %99 = mul nsw i32 %24, %17
  %100 = add nsw i32 %99, %26
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  store float %98, float addrspace(1)* %102, align 4, !tbaa !13
  br label %103

103:                                              ; preds = %43, %95, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !11, i64 0}
!15 = distinct !{!15, !8}
