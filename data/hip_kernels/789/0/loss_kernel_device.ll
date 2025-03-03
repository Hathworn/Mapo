; ModuleID = '../data/hip_kernels/789/0/main.cu'
source_filename = "../data/hip_kernels/789/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11loss_kerneliiiPKfS0_PKiS2_S0_PfS3_S3_f(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, float %11) local_unnamed_addr #0 {
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %17
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %1
  br i1 %22, label %23, label %153

23:                                               ; preds = %12
  %24 = mul nsw i32 %21, %0
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %25
  %27 = sext i32 %21 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = add nsw i32 %21, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = icmp slt i32 %29, %33
  br i1 %34, label %35, label %153

35:                                               ; preds = %23
  %36 = getelementptr inbounds float, float addrspace(1)* %9, i64 %27
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !11, !amdgpu.noclobber !5
  %38 = fadd contract float %37, %11
  %39 = icmp sgt i32 %0, 0
  %40 = and i32 %0, 7
  %41 = icmp ult i32 %0, 8
  %42 = and i32 %0, -8
  %43 = icmp eq i32 %40, 0
  br label %44

44:                                               ; preds = %35, %147
  %45 = phi i32 [ %29, %35 ], [ %151, %147 ]
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = getelementptr inbounds float, float addrspace(1)* %7, i64 %46
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !11
  %51 = mul nsw i32 %48, %0
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %4, i64 %52
  %54 = sext i32 %48 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %10, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !11
  %57 = fadd contract float %38, %56
  br i1 %39, label %58, label %147

58:                                               ; preds = %44
  br i1 %41, label %129, label %59

59:                                               ; preds = %58, %59
  %60 = phi i32 [ %126, %59 ], [ 0, %58 ]
  %61 = phi float [ %125, %59 ], [ %57, %58 ]
  %62 = phi i32 [ %127, %59 ], [ 0, %58 ]
  %63 = zext i32 %60 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %53, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !11
  %66 = getelementptr inbounds float, float addrspace(1)* %26, i64 %63
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !11
  %68 = fmul contract float %65, %67
  %69 = fadd contract float %61, %68
  %70 = or i32 %60, 1
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %53, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !11
  %74 = getelementptr inbounds float, float addrspace(1)* %26, i64 %71
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !11
  %76 = fmul contract float %73, %75
  %77 = fadd contract float %69, %76
  %78 = or i32 %60, 2
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %53, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11
  %82 = getelementptr inbounds float, float addrspace(1)* %26, i64 %79
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11
  %84 = fmul contract float %81, %83
  %85 = fadd contract float %77, %84
  %86 = or i32 %60, 3
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %53, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !11
  %90 = getelementptr inbounds float, float addrspace(1)* %26, i64 %87
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !11
  %92 = fmul contract float %89, %91
  %93 = fadd contract float %85, %92
  %94 = or i32 %60, 4
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %53, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11
  %98 = getelementptr inbounds float, float addrspace(1)* %26, i64 %95
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !11
  %100 = fmul contract float %97, %99
  %101 = fadd contract float %93, %100
  %102 = or i32 %60, 5
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %53, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !11
  %106 = getelementptr inbounds float, float addrspace(1)* %26, i64 %103
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !11
  %108 = fmul contract float %105, %107
  %109 = fadd contract float %101, %108
  %110 = or i32 %60, 6
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %53, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !11
  %114 = getelementptr inbounds float, float addrspace(1)* %26, i64 %111
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !11
  %116 = fmul contract float %113, %115
  %117 = fadd contract float %109, %116
  %118 = or i32 %60, 7
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %53, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !11
  %122 = getelementptr inbounds float, float addrspace(1)* %26, i64 %119
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !11
  %124 = fmul contract float %121, %123
  %125 = fadd contract float %117, %124
  %126 = add nuw nsw i32 %60, 8
  %127 = add i32 %62, 8
  %128 = icmp eq i32 %127, %42
  br i1 %128, label %129, label %59, !llvm.loop !13

129:                                              ; preds = %59, %58
  %130 = phi float [ undef, %58 ], [ %125, %59 ]
  %131 = phi i32 [ 0, %58 ], [ %126, %59 ]
  %132 = phi float [ %57, %58 ], [ %125, %59 ]
  br i1 %43, label %147, label %133

133:                                              ; preds = %129, %133
  %134 = phi i32 [ %144, %133 ], [ %131, %129 ]
  %135 = phi float [ %143, %133 ], [ %132, %129 ]
  %136 = phi i32 [ %145, %133 ], [ 0, %129 ]
  %137 = zext i32 %134 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %53, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !11
  %140 = getelementptr inbounds float, float addrspace(1)* %26, i64 %137
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !11
  %142 = fmul contract float %139, %141
  %143 = fadd contract float %135, %142
  %144 = add nuw nsw i32 %134, 1
  %145 = add i32 %136, 1
  %146 = icmp eq i32 %145, %40
  br i1 %146, label %147, label %133, !llvm.loop !15

147:                                              ; preds = %129, %133, %44
  %148 = phi float [ %57, %44 ], [ %130, %129 ], [ %143, %133 ]
  %149 = fsub contract float %50, %148
  %150 = getelementptr inbounds float, float addrspace(1)* %8, i64 %46
  store float %149, float addrspace(1)* %150, align 4, !tbaa !11
  %151 = add nsw i32 %45, 1
  %152 = icmp slt i32 %151, %33
  br i1 %152, label %44, label %153, !llvm.loop !17

153:                                              ; preds = %147, %23, %12
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
