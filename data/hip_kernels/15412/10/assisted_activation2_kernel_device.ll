; ModuleID = '../data/hip_kernels/15412/10/main.cu'
source_filename = "../data/hip_kernels/15412/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27assisted_activation2_kernelfPfS_S_iii(float %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readnone %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = freeze i32 %16
  %18 = freeze i32 %4
  %19 = sdiv i32 %17, %18
  %20 = mul i32 %19, %18
  %21 = sub i32 %17, %20
  %22 = fsub contract float 1.000000e+00, %0
  %23 = icmp slt i32 %19, %6
  %24 = icmp sgt i32 %5, 0
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %107

26:                                               ; preds = %7
  %27 = sext i32 %16 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %2, i64 %27
  %29 = mul nsw i32 %19, %5
  %30 = and i32 %5, 3
  %31 = icmp ult i32 %5, 4
  br i1 %31, label %87, label %32

32:                                               ; preds = %26
  %33 = and i32 %5, -4
  br label %34

34:                                               ; preds = %83, %32
  %35 = phi i32 [ 0, %32 ], [ %84, %83 ]
  %36 = phi i32 [ 0, %32 ], [ %85, %83 ]
  %37 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %38 = fcmp contract oeq float %37, 0.000000e+00
  br i1 %38, label %39, label %47

39:                                               ; preds = %34
  %40 = add nsw i32 %35, %29
  %41 = mul nsw i32 %40, %4
  %42 = add nsw i32 %41, %21
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = fmul contract float %22, %45
  store float %46, float addrspace(1)* %44, align 4, !tbaa !7
  br label %47

47:                                               ; preds = %34, %39
  %48 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %49 = fcmp contract oeq float %48, 0.000000e+00
  br i1 %49, label %50, label %59

50:                                               ; preds = %47
  %51 = or i32 %35, 1
  %52 = add nsw i32 %51, %29
  %53 = mul nsw i32 %52, %4
  %54 = add nsw i32 %53, %21
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = fmul contract float %22, %57
  store float %58, float addrspace(1)* %56, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %50, %47
  %60 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %61 = fcmp contract oeq float %60, 0.000000e+00
  br i1 %61, label %62, label %71

62:                                               ; preds = %59
  %63 = or i32 %35, 2
  %64 = add nsw i32 %63, %29
  %65 = mul nsw i32 %64, %4
  %66 = add nsw i32 %65, %21
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = fmul contract float %22, %69
  store float %70, float addrspace(1)* %68, align 4, !tbaa !7
  br label %71

71:                                               ; preds = %62, %59
  %72 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %73 = fcmp contract oeq float %72, 0.000000e+00
  br i1 %73, label %74, label %83

74:                                               ; preds = %71
  %75 = or i32 %35, 3
  %76 = add nsw i32 %75, %29
  %77 = mul nsw i32 %76, %4
  %78 = add nsw i32 %77, %21
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fmul contract float %22, %81
  store float %82, float addrspace(1)* %80, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %74, %71
  %84 = add nuw nsw i32 %35, 4
  %85 = add i32 %36, 4
  %86 = icmp eq i32 %85, %33
  br i1 %86, label %87, label %34, !llvm.loop !11

87:                                               ; preds = %83, %26
  %88 = phi i32 [ 0, %26 ], [ %84, %83 ]
  %89 = icmp eq i32 %30, 0
  br i1 %89, label %107, label %90

90:                                               ; preds = %87, %103
  %91 = phi i32 [ %104, %103 ], [ %88, %87 ]
  %92 = phi i32 [ %105, %103 ], [ 0, %87 ]
  %93 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %94 = fcmp contract oeq float %93, 0.000000e+00
  br i1 %94, label %95, label %103

95:                                               ; preds = %90
  %96 = add nsw i32 %91, %29
  %97 = mul nsw i32 %96, %4
  %98 = add nsw i32 %97, %21
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = fmul contract float %22, %101
  store float %102, float addrspace(1)* %100, align 4, !tbaa !7
  br label %103

103:                                              ; preds = %95, %90
  %104 = add nuw nsw i32 %91, 1
  %105 = add i32 %92, 1
  %106 = icmp eq i32 %105, %30
  br i1 %106, label %107, label %90, !llvm.loop !13

107:                                              ; preds = %87, %103, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
