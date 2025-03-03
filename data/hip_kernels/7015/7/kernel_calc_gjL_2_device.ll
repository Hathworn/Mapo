; ModuleID = '../data/hip_kernels/7015/7/main.cu'
source_filename = "../data/hip_kernels/7015/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sm = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17kernel_calc_gjL_2iPiS_S_PfS0_S0_S0_S0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readnone %5, float addrspace(1)* nocapture readnone %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = add i32 %17, %10
  %19 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %24 = sext i32 %0 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = add nsw i32 %0, 1
  %28 = sext i32 %27 to i64
  %29 = add nsw i32 %26, -1
  %30 = icmp slt i32 %18, %29
  br i1 %30, label %31, label %169

31:                                               ; preds = %9
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = add nsw i32 %33, -1
  %35 = icmp slt i32 %23, %34
  br i1 %35, label %36, label %42

36:                                               ; preds = %31
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %24
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = mul nsw i32 %34, %18
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %49

42:                                               ; preds = %49, %31
  %43 = phi float [ 0.000000e+00, %31 ], [ %62, %49 ]
  %44 = mul nuw nsw i32 %10, %22
  %45 = add nuw nsw i32 %44, %23
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %45
  %47 = bitcast i32 addrspace(3)* %46 to float addrspace(3)*
  store float %43, float addrspace(3)* %47, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp eq i32 %23, 0
  br i1 %48, label %65, label %169

49:                                               ; preds = %36, %49
  %50 = phi float [ 0.000000e+00, %36 ], [ %62, %49 ]
  %51 = phi i32 [ %23, %36 ], [ %63, %49 ]
  %52 = add i32 %51, %39
  %53 = add i32 %52, %38
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %8, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !11, !amdgpu.noclobber !6
  %57 = add nsw i32 %41, %51
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %7, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !11, !amdgpu.noclobber !6
  %61 = fmul contract float %56, %60
  %62 = fadd contract float %50, %61
  %63 = add nuw nsw i32 %51, %22
  %64 = icmp slt i32 %63, %34
  br i1 %64, label %49, label %42, !llvm.loop !13

65:                                               ; preds = %42
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %24
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = add nsw i32 %67, %18
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !11, !amdgpu.noclobber !6
  %72 = fneg contract float %71
  %73 = fmul float %71, 0xBFF7154760000000
  %74 = tail call float @llvm.rint.f32(float %73)
  %75 = fcmp olt float %71, 0xC0562E4300000000
  %76 = fcmp ogt float %71, 0x4059D1DA00000000
  %77 = fneg float %73
  %78 = tail call float @llvm.fma.f32(float %72, float 0x3FF7154760000000, float %77)
  %79 = tail call float @llvm.fma.f32(float %72, float 0x3E54AE0BE0000000, float %78)
  %80 = fsub float %73, %74
  %81 = fadd float %79, %80
  %82 = tail call float @llvm.exp2.f32(float %81)
  %83 = fptosi float %74 to i32
  %84 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 %83)
  %85 = select i1 %76, float 0.000000e+00, float %84
  %86 = select i1 %75, float 0x7FF0000000000000, float %85
  %87 = fadd contract float %86, 1.000000e+00
  %88 = fmul contract float %87, %87
  %89 = and i32 %22, 7
  %90 = icmp ult i16 %21, 8
  br i1 %90, label %93, label %91

91:                                               ; preds = %65
  %92 = and i32 %22, 2040
  br label %115

93:                                               ; preds = %115, %65
  %94 = phi float [ undef, %65 ], [ %165, %115 ]
  %95 = phi i32 [ 0, %65 ], [ %166, %115 ]
  %96 = phi float [ 0.000000e+00, %65 ], [ %165, %115 ]
  %97 = icmp eq i32 %89, 0
  br i1 %97, label %110, label %98

98:                                               ; preds = %93, %98
  %99 = phi i32 [ %107, %98 ], [ %95, %93 ]
  %100 = phi float [ %106, %98 ], [ %96, %93 ]
  %101 = phi i32 [ %108, %98 ], [ 0, %93 ]
  %102 = add nuw nsw i32 %99, %44
  %103 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %102
  %104 = bitcast i32 addrspace(3)* %103 to float addrspace(3)*
  %105 = load float, float addrspace(3)* %104, align 4, !tbaa !11
  %106 = fadd contract float %100, %105
  %107 = add nuw nsw i32 %99, 1
  %108 = add i32 %101, 1
  %109 = icmp eq i32 %108, %89
  br i1 %109, label %110, label %98, !llvm.loop !15

110:                                              ; preds = %98, %93
  %111 = phi float [ %94, %93 ], [ %106, %98 ]
  %112 = fdiv contract float %86, %88
  %113 = fmul contract float %112, %111
  %114 = getelementptr inbounds float, float addrspace(1)* %7, i64 %69
  store float %113, float addrspace(1)* %114, align 4, !tbaa !11
  br label %169

115:                                              ; preds = %115, %91
  %116 = phi i32 [ 0, %91 ], [ %166, %115 ]
  %117 = phi float [ 0.000000e+00, %91 ], [ %165, %115 ]
  %118 = phi i32 [ 0, %91 ], [ %167, %115 ]
  %119 = add nuw nsw i32 %116, %44
  %120 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %119
  %121 = bitcast i32 addrspace(3)* %120 to float addrspace(3)*
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !11
  %123 = fadd contract float %117, %122
  %124 = or i32 %116, 1
  %125 = add nuw nsw i32 %124, %44
  %126 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %125
  %127 = bitcast i32 addrspace(3)* %126 to float addrspace(3)*
  %128 = load float, float addrspace(3)* %127, align 4, !tbaa !11
  %129 = fadd contract float %123, %128
  %130 = or i32 %116, 2
  %131 = add nuw nsw i32 %130, %44
  %132 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %131
  %133 = bitcast i32 addrspace(3)* %132 to float addrspace(3)*
  %134 = load float, float addrspace(3)* %133, align 4, !tbaa !11
  %135 = fadd contract float %129, %134
  %136 = or i32 %116, 3
  %137 = add nuw nsw i32 %136, %44
  %138 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %137
  %139 = bitcast i32 addrspace(3)* %138 to float addrspace(3)*
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !11
  %141 = fadd contract float %135, %140
  %142 = or i32 %116, 4
  %143 = add nuw nsw i32 %142, %44
  %144 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %143
  %145 = bitcast i32 addrspace(3)* %144 to float addrspace(3)*
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !11
  %147 = fadd contract float %141, %146
  %148 = or i32 %116, 5
  %149 = add nuw nsw i32 %148, %44
  %150 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %149
  %151 = bitcast i32 addrspace(3)* %150 to float addrspace(3)*
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !11
  %153 = fadd contract float %147, %152
  %154 = or i32 %116, 6
  %155 = add nuw nsw i32 %154, %44
  %156 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %155
  %157 = bitcast i32 addrspace(3)* %156 to float addrspace(3)*
  %158 = load float, float addrspace(3)* %157, align 4, !tbaa !11
  %159 = fadd contract float %153, %158
  %160 = or i32 %116, 7
  %161 = add nuw nsw i32 %160, %44
  %162 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sm, i32 0, i32 %161
  %163 = bitcast i32 addrspace(3)* %162 to float addrspace(3)*
  %164 = load float, float addrspace(3)* %163, align 4, !tbaa !11
  %165 = fadd contract float %159, %164
  %166 = add nuw nsw i32 %116, 8
  %167 = add i32 %118, 8
  %168 = icmp eq i32 %167, %92
  br i1 %168, label %93, label %115, !llvm.loop !17

169:                                              ; preds = %42, %110, %9
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
