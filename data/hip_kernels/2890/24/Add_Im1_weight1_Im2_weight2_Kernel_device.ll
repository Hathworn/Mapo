; ModuleID = '../data/hip_kernels/2890/24/main.cu'
source_filename = "../data/hip_kernels/2890/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z34Add_Im1_weight1_Im2_weight2_KernelPfPKffS1_fiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float %2, float addrspace(1)* nocapture readonly %3, float %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = icmp slt i32 %17, %5
  %27 = icmp slt i32 %25, %6
  %28 = select i1 %26, i1 %27, i1 false
  %29 = icmp sgt i32 %7, 0
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %151

31:                                               ; preds = %8
  %32 = mul nsw i32 %25, %5
  %33 = add nsw i32 %32, %17
  %34 = mul nsw i32 %33, %7
  %35 = and i32 %7, 7
  %36 = icmp ult i32 %7, 8
  br i1 %36, label %132, label %37

37:                                               ; preds = %31
  %38 = and i32 %7, -8
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i32 [ 0, %37 ], [ %129, %39 ]
  %41 = phi i32 [ 0, %37 ], [ %130, %39 ]
  %42 = add nsw i32 %40, %34
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = fmul contract float %45, %2
  %47 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = fmul contract float %48, %4
  %50 = fadd contract float %46, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  store float %50, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = or i32 %40, 1
  %53 = add nsw i32 %52, %34
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = fmul contract float %56, %2
  %58 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fmul contract float %59, %4
  %61 = fadd contract float %57, %60
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  store float %61, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = or i32 %40, 2
  %64 = add nsw i32 %63, %34
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fmul contract float %67, %2
  %69 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fmul contract float %70, %4
  %72 = fadd contract float %68, %71
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  store float %72, float addrspace(1)* %73, align 4, !tbaa !7
  %74 = or i32 %40, 3
  %75 = add nsw i32 %74, %34
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = fmul contract float %78, %2
  %80 = getelementptr inbounds float, float addrspace(1)* %3, i64 %76
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fmul contract float %81, %4
  %83 = fadd contract float %79, %82
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  store float %83, float addrspace(1)* %84, align 4, !tbaa !7
  %85 = or i32 %40, 4
  %86 = add nsw i32 %85, %34
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = fmul contract float %89, %2
  %91 = getelementptr inbounds float, float addrspace(1)* %3, i64 %87
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = fmul contract float %92, %4
  %94 = fadd contract float %90, %93
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %94, float addrspace(1)* %95, align 4, !tbaa !7
  %96 = or i32 %40, 5
  %97 = add nsw i32 %96, %34
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fmul contract float %100, %2
  %102 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = fmul contract float %103, %4
  %105 = fadd contract float %101, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  store float %105, float addrspace(1)* %106, align 4, !tbaa !7
  %107 = or i32 %40, 6
  %108 = add nsw i32 %107, %34
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = fmul contract float %111, %2
  %113 = getelementptr inbounds float, float addrspace(1)* %3, i64 %109
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = fmul contract float %114, %4
  %116 = fadd contract float %112, %115
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  store float %116, float addrspace(1)* %117, align 4, !tbaa !7
  %118 = or i32 %40, 7
  %119 = add nsw i32 %118, %34
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fmul contract float %122, %2
  %124 = getelementptr inbounds float, float addrspace(1)* %3, i64 %120
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7
  %126 = fmul contract float %125, %4
  %127 = fadd contract float %123, %126
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  store float %127, float addrspace(1)* %128, align 4, !tbaa !7
  %129 = add nuw nsw i32 %40, 8
  %130 = add i32 %41, 8
  %131 = icmp eq i32 %130, %38
  br i1 %131, label %132, label %39, !llvm.loop !11

132:                                              ; preds = %39, %31
  %133 = phi i32 [ 0, %31 ], [ %129, %39 ]
  %134 = icmp eq i32 %35, 0
  br i1 %134, label %151, label %135

135:                                              ; preds = %132, %135
  %136 = phi i32 [ %148, %135 ], [ %133, %132 ]
  %137 = phi i32 [ %149, %135 ], [ 0, %132 ]
  %138 = add nsw i32 %136, %34
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = fmul contract float %141, %2
  %143 = getelementptr inbounds float, float addrspace(1)* %3, i64 %139
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = fmul contract float %144, %4
  %146 = fadd contract float %142, %145
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  store float %146, float addrspace(1)* %147, align 4, !tbaa !7
  %148 = add nuw nsw i32 %136, 1
  %149 = add i32 %137, 1
  %150 = icmp eq i32 %149, %35
  br i1 %150, label %151, label %135, !llvm.loop !13

151:                                              ; preds = %132, %135, %8
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
