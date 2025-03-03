; ModuleID = '../data/hip_kernels/15542/0/main.cu'
source_filename = "../data/hip_kernels/15542/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12Kernel_normePfS_PiS0_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = zext i32 %16 to i64
  %18 = sext i32 %4 to i64
  %19 = icmp slt i64 %17, %18
  br i1 %19, label %20, label %152

20:                                               ; preds = %7
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %17
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %55

24:                                               ; preds = %20
  %25 = sext i32 %6 to i64
  %26 = mul nsw i64 %17, %25
  %27 = sext i32 %5 to i64
  %28 = mul nsw i64 %17, %27
  %29 = and i32 %22, 7
  %30 = icmp ult i32 %22, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %24
  %32 = and i32 %22, -8
  br label %58

33:                                               ; preds = %58, %24
  %34 = phi float [ undef, %24 ], [ %148, %58 ]
  %35 = phi i32 [ 0, %24 ], [ %149, %58 ]
  %36 = phi float [ 0.000000e+00, %24 ], [ %148, %58 ]
  %37 = icmp eq i32 %29, 0
  br i1 %37, label %55, label %38

38:                                               ; preds = %33, %38
  %39 = phi i32 [ %52, %38 ], [ %35, %33 ]
  %40 = phi float [ %51, %38 ], [ %36, %33 ]
  %41 = phi i32 [ %53, %38 ], [ 0, %33 ]
  %42 = zext i32 %39 to i64
  %43 = add nsw i64 %26, %42
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = sext i32 %45 to i64
  %47 = add nsw i64 %28, %46
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !11, !amdgpu.noclobber !6
  %50 = fmul contract float %49, %49
  %51 = fadd contract float %40, %50
  %52 = add nuw nsw i32 %39, 1
  %53 = add i32 %41, 1
  %54 = icmp eq i32 %53, %29
  br i1 %54, label %55, label %38, !llvm.loop !13

55:                                               ; preds = %33, %38, %20
  %56 = phi float [ 0.000000e+00, %20 ], [ %34, %33 ], [ %51, %38 ]
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  store float %56, float addrspace(1)* %57, align 4, !tbaa !11
  br label %152

58:                                               ; preds = %58, %31
  %59 = phi i32 [ 0, %31 ], [ %149, %58 ]
  %60 = phi float [ 0.000000e+00, %31 ], [ %148, %58 ]
  %61 = phi i32 [ 0, %31 ], [ %150, %58 ]
  %62 = zext i32 %59 to i64
  %63 = add nsw i64 %26, %62
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = sext i32 %65 to i64
  %67 = add nsw i64 %28, %66
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11, !amdgpu.noclobber !6
  %70 = fmul contract float %69, %69
  %71 = fadd contract float %60, %70
  %72 = or i32 %59, 1
  %73 = zext i32 %72 to i64
  %74 = add nsw i64 %26, %73
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = sext i32 %76 to i64
  %78 = add nsw i64 %28, %77
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !11, !amdgpu.noclobber !6
  %81 = fmul contract float %80, %80
  %82 = fadd contract float %71, %81
  %83 = or i32 %59, 2
  %84 = zext i32 %83 to i64
  %85 = add nsw i64 %26, %84
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  %88 = sext i32 %87 to i64
  %89 = add nsw i64 %28, %88
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !11, !amdgpu.noclobber !6
  %92 = fmul contract float %91, %91
  %93 = fadd contract float %82, %92
  %94 = or i32 %59, 3
  %95 = zext i32 %94 to i64
  %96 = add nsw i64 %26, %95
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !6
  %99 = sext i32 %98 to i64
  %100 = add nsw i64 %28, %99
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !11, !amdgpu.noclobber !6
  %103 = fmul contract float %102, %102
  %104 = fadd contract float %93, %103
  %105 = or i32 %59, 4
  %106 = zext i32 %105 to i64
  %107 = add nsw i64 %26, %106
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = sext i32 %109 to i64
  %111 = add nsw i64 %28, %110
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !11, !amdgpu.noclobber !6
  %114 = fmul contract float %113, %113
  %115 = fadd contract float %104, %114
  %116 = or i32 %59, 5
  %117 = zext i32 %116 to i64
  %118 = add nsw i64 %26, %117
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !6
  %121 = sext i32 %120 to i64
  %122 = add nsw i64 %28, %121
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !11, !amdgpu.noclobber !6
  %125 = fmul contract float %124, %124
  %126 = fadd contract float %115, %125
  %127 = or i32 %59, 6
  %128 = zext i32 %127 to i64
  %129 = add nsw i64 %26, %128
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %129
  %131 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !6
  %132 = sext i32 %131 to i64
  %133 = add nsw i64 %28, %132
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !11, !amdgpu.noclobber !6
  %136 = fmul contract float %135, %135
  %137 = fadd contract float %126, %136
  %138 = or i32 %59, 7
  %139 = zext i32 %138 to i64
  %140 = add nsw i64 %26, %139
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !6
  %143 = sext i32 %142 to i64
  %144 = add nsw i64 %28, %143
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !11, !amdgpu.noclobber !6
  %147 = fmul contract float %146, %146
  %148 = fadd contract float %137, %147
  %149 = add nuw nsw i32 %59, 8
  %150 = add i32 %61, 8
  %151 = icmp eq i32 %150, %32
  br i1 %151, label %33, label %58, !llvm.loop !15

152:                                              ; preds = %55, %7
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
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
