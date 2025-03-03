; ModuleID = '../data/hip_kernels/7264/62/main.cu'
source_filename = "../data/hip_kernels/7264/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11convolutionPfiiiS_iiiiiS_i(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float addrspace(1)* nocapture %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = mul i32 %21, %8
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !4, !invariant.load !5
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %30 = add i32 %28, %29
  %31 = mul i32 %30, %9
  %32 = sub nsw i32 %1, %5
  %33 = icmp sgt i32 %22, %32
  %34 = sub nsw i32 %2, %6
  %35 = icmp sgt i32 %31, %34
  %36 = select i1 %33, i1 true, i1 %35
  br i1 %36, label %144, label %37

37:                                               ; preds = %12
  %38 = mul nsw i32 %31, %11
  %39 = add nsw i32 %38, %22
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %10, i64 %40
  store float 0.000000e+00, float addrspace(1)* %41, align 4, !tbaa !7
  %42 = icmp sgt i32 %5, 0
  br i1 %42, label %43, label %144

43:                                               ; preds = %37
  %44 = icmp sgt i32 %6, 0
  %45 = and i32 %6, 3
  %46 = icmp ult i32 %6, 4
  %47 = and i32 %6, -4
  %48 = icmp eq i32 %45, 0
  br label %49

49:                                               ; preds = %43, %140
  %50 = phi float [ 0.000000e+00, %43 ], [ %141, %140 ]
  %51 = phi i32 [ 0, %43 ], [ %142, %140 ]
  br i1 %44, label %52, label %140

52:                                               ; preds = %49
  %53 = add nsw i32 %51, %22
  br i1 %46, label %116, label %54

54:                                               ; preds = %52, %54
  %55 = phi float [ %112, %54 ], [ %50, %52 ]
  %56 = phi i32 [ %113, %54 ], [ 0, %52 ]
  %57 = phi i32 [ %114, %54 ], [ 0, %52 ]
  %58 = mul nsw i32 %56, %7
  %59 = add nsw i32 %58, %51
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %4, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = add nsw i32 %56, %31
  %64 = mul nsw i32 %63, %3
  %65 = add nsw i32 %53, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fmul contract float %62, %68
  %70 = fadd contract float %55, %69
  store float %70, float addrspace(1)* %41, align 4, !tbaa !7
  %71 = or i32 %56, 1
  %72 = mul nsw i32 %71, %7
  %73 = add nsw i32 %72, %51
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = add nsw i32 %71, %31
  %78 = mul nsw i32 %77, %3
  %79 = add nsw i32 %53, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fmul contract float %76, %82
  %84 = fadd contract float %70, %83
  store float %84, float addrspace(1)* %41, align 4, !tbaa !7
  %85 = or i32 %56, 2
  %86 = mul nsw i32 %85, %7
  %87 = add nsw i32 %86, %51
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %4, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = add nsw i32 %85, %31
  %92 = mul nsw i32 %91, %3
  %93 = add nsw i32 %53, %92
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fmul contract float %90, %96
  %98 = fadd contract float %84, %97
  store float %98, float addrspace(1)* %41, align 4, !tbaa !7
  %99 = or i32 %56, 3
  %100 = mul nsw i32 %99, %7
  %101 = add nsw i32 %100, %51
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %4, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = add nsw i32 %99, %31
  %106 = mul nsw i32 %105, %3
  %107 = add nsw i32 %53, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = fmul contract float %104, %110
  %112 = fadd contract float %98, %111
  store float %112, float addrspace(1)* %41, align 4, !tbaa !7
  %113 = add nuw nsw i32 %56, 4
  %114 = add i32 %57, 4
  %115 = icmp eq i32 %114, %47
  br i1 %115, label %116, label %54, !llvm.loop !11

116:                                              ; preds = %54, %52
  %117 = phi float [ undef, %52 ], [ %112, %54 ]
  %118 = phi float [ %50, %52 ], [ %112, %54 ]
  %119 = phi i32 [ 0, %52 ], [ %113, %54 ]
  br i1 %48, label %140, label %120

120:                                              ; preds = %116, %120
  %121 = phi float [ %136, %120 ], [ %118, %116 ]
  %122 = phi i32 [ %137, %120 ], [ %119, %116 ]
  %123 = phi i32 [ %138, %120 ], [ 0, %116 ]
  %124 = mul nsw i32 %122, %7
  %125 = add nsw i32 %124, %51
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %4, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  %129 = add nsw i32 %122, %31
  %130 = mul nsw i32 %129, %3
  %131 = add nsw i32 %53, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = fmul contract float %128, %134
  %136 = fadd contract float %121, %135
  store float %136, float addrspace(1)* %41, align 4, !tbaa !7
  %137 = add nuw nsw i32 %122, 1
  %138 = add i32 %123, 1
  %139 = icmp eq i32 %138, %45
  br i1 %139, label %140, label %120, !llvm.loop !13

140:                                              ; preds = %116, %120, %49
  %141 = phi float [ %50, %49 ], [ %117, %116 ], [ %136, %120 ]
  %142 = add nuw nsw i32 %51, 1
  %143 = icmp eq i32 %142, %5
  br i1 %143, label %144, label %49, !llvm.loop !15

144:                                              ; preds = %140, %37, %12
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
