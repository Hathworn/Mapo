; ModuleID = '../data/hip_kernels/4312/35/main.cu'
source_filename = "../data/hip_kernels/4312/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25assembleBinBlockCSRKerneljPKfS0_PKiPKjPf(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %7
  %16 = icmp ult i32 %15, %0
  br i1 %16, label %17, label %122

17:                                               ; preds = %6
  %18 = zext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = freeze i32 %15
  %22 = udiv i32 %21, 6
  %23 = mul i32 %22, 6
  %24 = sub i32 %21, %23
  %25 = mul i32 %22, 36
  %26 = add i32 %25, %24
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %30 = sext i32 %20 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  store float %29, float addrspace(1)* %31, align 4, !tbaa !11
  %32 = add nsw i32 %20, 32
  %33 = add i32 %26, 6
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !11
  %37 = sext i32 %32 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %5, i64 %37
  store float %36, float addrspace(1)* %38, align 4, !tbaa !11
  %39 = add nsw i32 %20, 64
  %40 = add i32 %26, 12
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !11
  %44 = sext i32 %39 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %5, i64 %44
  store float %43, float addrspace(1)* %45, align 4, !tbaa !11
  %46 = add nsw i32 %20, 96
  %47 = add i32 %26, 18
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !11
  %51 = sext i32 %46 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  store float %50, float addrspace(1)* %52, align 4, !tbaa !11
  %53 = add nsw i32 %20, 128
  %54 = add i32 %26, 24
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11
  %58 = sext i32 %53 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  store float %57, float addrspace(1)* %59, align 4, !tbaa !11
  %60 = add nsw i32 %20, 160
  %61 = add i32 %26, 30
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !11
  %65 = sext i32 %60 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %5, i64 %65
  store float %64, float addrspace(1)* %66, align 4, !tbaa !11
  %67 = zext i32 %22 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %67
  %69 = bitcast i32 addrspace(1)* %68 to <2 x i32> addrspace(1)*
  %70 = load <2 x i32>, <2 x i32> addrspace(1)* %69, align 4, !tbaa !7
  %71 = extractelement <2 x i32> %70, i64 0
  %72 = extractelement <2 x i32> %70, i64 1
  %73 = icmp ult i32 %71, %72
  br i1 %73, label %74, label %122

74:                                               ; preds = %17, %74
  %75 = phi i32 [ %120, %74 ], [ %71, %17 ]
  %76 = phi i32 [ %77, %74 ], [ %20, %17 ]
  %77 = add nsw i32 %76, 192
  %78 = mul i32 %75, 36
  %79 = add i32 %78, %24
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11
  %83 = sext i32 %77 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %5, i64 %83
  store float %82, float addrspace(1)* %84, align 4, !tbaa !11
  %85 = add nsw i32 %76, 224
  %86 = add i32 %79, 6
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !11
  %90 = sext i32 %85 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %5, i64 %90
  store float %89, float addrspace(1)* %91, align 4, !tbaa !11
  %92 = add nsw i32 %76, 256
  %93 = add i32 %79, 12
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !11
  %97 = sext i32 %92 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %5, i64 %97
  store float %96, float addrspace(1)* %98, align 4, !tbaa !11
  %99 = add nsw i32 %76, 288
  %100 = add i32 %79, 18
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !11
  %104 = sext i32 %99 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %5, i64 %104
  store float %103, float addrspace(1)* %105, align 4, !tbaa !11
  %106 = add nsw i32 %76, 320
  %107 = add i32 %79, 24
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %2, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !11
  %111 = sext i32 %106 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %5, i64 %111
  store float %110, float addrspace(1)* %112, align 4, !tbaa !11
  %113 = add nsw i32 %76, 352
  %114 = add i32 %79, 30
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %2, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !11
  %118 = sext i32 %113 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %5, i64 %118
  store float %117, float addrspace(1)* %119, align 4, !tbaa !11
  %120 = add nuw i32 %75, 1
  %121 = icmp ult i32 %120, %72
  br i1 %121, label %74, label %122, !llvm.loop !13

122:                                              ; preds = %74, %17, %6
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
