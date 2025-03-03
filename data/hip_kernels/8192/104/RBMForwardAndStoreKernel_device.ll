; ModuleID = '../data/hip_kernels/8192/104/main.cu'
source_filename = "../data/hip_kernels/8192/104/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24RBMForwardAndStoreKernelPfS_S_S_S_fiibS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float %5, i32 %6, i32 %7, i1 %8, float addrspace(1)* nocapture readonly %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = udiv i32 %18, %15
  %22 = mul i32 %21, %15
  %23 = icmp ugt i32 %18, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %20
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %19
  %29 = mul i32 %28, %15
  %30 = add i32 %29, %27
  %31 = icmp slt i32 %30, %7
  br i1 %31, label %32, label %186

32:                                               ; preds = %10
  br i1 %8, label %33, label %38

33:                                               ; preds = %32
  %34 = sext i32 %30 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %9, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !5
  %37 = fcmp contract une float %36, 0.000000e+00
  br i1 %37, label %38, label %181

38:                                               ; preds = %33, %32
  %39 = icmp sgt i32 %6, 0
  br i1 %39, label %40, label %155

40:                                               ; preds = %38
  %41 = and i32 %6, 7
  %42 = icmp ult i32 %6, 8
  br i1 %42, label %132, label %43

43:                                               ; preds = %40
  %44 = and i32 %6, -8
  br label %45

45:                                               ; preds = %45, %43
  %46 = phi i32 [ 0, %43 ], [ %129, %45 ]
  %47 = phi i32 [ %30, %43 ], [ %128, %45 ]
  %48 = phi float [ 0.000000e+00, %43 ], [ %127, %45 ]
  %49 = phi i32 [ 0, %43 ], [ %130, %45 ]
  %50 = sext i32 %47 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16, !amdgpu.noclobber !5
  %53 = zext i32 %46 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16, !amdgpu.noclobber !5
  %56 = fmul contract float %52, %55
  %57 = fadd contract float %48, %56
  %58 = add nsw i32 %47, %7
  %59 = or i32 %46, 1
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !5
  %63 = zext i32 %59 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !5
  %66 = fmul contract float %62, %65
  %67 = fadd contract float %57, %66
  %68 = add nsw i32 %58, %7
  %69 = or i32 %46, 2
  %70 = sext i32 %68 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !5
  %73 = zext i32 %69 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16, !amdgpu.noclobber !5
  %76 = fmul contract float %72, %75
  %77 = fadd contract float %67, %76
  %78 = add nsw i32 %68, %7
  %79 = or i32 %46, 3
  %80 = sext i32 %78 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16, !amdgpu.noclobber !5
  %83 = zext i32 %79 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16, !amdgpu.noclobber !5
  %86 = fmul contract float %82, %85
  %87 = fadd contract float %77, %86
  %88 = add nsw i32 %78, %7
  %89 = or i32 %46, 4
  %90 = sext i32 %88 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !5
  %93 = zext i32 %89 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16, !amdgpu.noclobber !5
  %96 = fmul contract float %92, %95
  %97 = fadd contract float %87, %96
  %98 = add nsw i32 %88, %7
  %99 = or i32 %46, 5
  %100 = sext i32 %98 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16, !amdgpu.noclobber !5
  %103 = zext i32 %99 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !5
  %106 = fmul contract float %102, %105
  %107 = fadd contract float %97, %106
  %108 = add nsw i32 %98, %7
  %109 = or i32 %46, 6
  %110 = sext i32 %108 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16, !amdgpu.noclobber !5
  %113 = zext i32 %109 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16, !amdgpu.noclobber !5
  %116 = fmul contract float %112, %115
  %117 = fadd contract float %107, %116
  %118 = add nsw i32 %108, %7
  %119 = or i32 %46, 7
  %120 = sext i32 %118 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16, !amdgpu.noclobber !5
  %123 = zext i32 %119 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16, !amdgpu.noclobber !5
  %126 = fmul contract float %122, %125
  %127 = fadd contract float %117, %126
  %128 = add nsw i32 %118, %7
  %129 = add nuw nsw i32 %46, 8
  %130 = add i32 %49, 8
  %131 = icmp eq i32 %130, %44
  br i1 %131, label %132, label %45, !llvm.loop !20

132:                                              ; preds = %45, %40
  %133 = phi float [ undef, %40 ], [ %127, %45 ]
  %134 = phi i32 [ 0, %40 ], [ %129, %45 ]
  %135 = phi i32 [ %30, %40 ], [ %128, %45 ]
  %136 = phi float [ 0.000000e+00, %40 ], [ %127, %45 ]
  %137 = icmp eq i32 %41, 0
  br i1 %137, label %155, label %138

138:                                              ; preds = %132, %138
  %139 = phi i32 [ %152, %138 ], [ %134, %132 ]
  %140 = phi i32 [ %151, %138 ], [ %135, %132 ]
  %141 = phi float [ %150, %138 ], [ %136, %132 ]
  %142 = phi i32 [ %153, %138 ], [ 0, %132 ]
  %143 = sext i32 %140 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %2, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !16, !amdgpu.noclobber !5
  %146 = zext i32 %139 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16, !amdgpu.noclobber !5
  %149 = fmul contract float %145, %148
  %150 = fadd contract float %141, %149
  %151 = add nsw i32 %140, %7
  %152 = add nuw nsw i32 %139, 1
  %153 = add i32 %142, 1
  %154 = icmp eq i32 %153, %41
  br i1 %154, label %155, label %138, !llvm.loop !22

155:                                              ; preds = %132, %138, %38
  %156 = phi float [ 0.000000e+00, %38 ], [ %133, %132 ], [ %150, %138 ]
  %157 = sext i32 %30 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %3, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !16, !amdgpu.noclobber !5
  %160 = fadd contract float %156, %159
  %161 = fneg contract float %5
  %162 = fmul contract float %160, %161
  %163 = fmul float %162, 0x3FF7154760000000
  %164 = tail call float @llvm.rint.f32(float %163)
  %165 = fcmp ogt float %162, 0x40562E4300000000
  %166 = fcmp olt float %162, 0xC059D1DA00000000
  %167 = fneg float %163
  %168 = tail call float @llvm.fma.f32(float %162, float 0x3FF7154760000000, float %167)
  %169 = tail call float @llvm.fma.f32(float %162, float 0x3E54AE0BE0000000, float %168)
  %170 = fsub float %163, %164
  %171 = fadd float %169, %170
  %172 = tail call float @llvm.exp2.f32(float %171)
  %173 = fptosi float %164 to i32
  %174 = tail call float @llvm.amdgcn.ldexp.f32(float %172, i32 %173)
  %175 = select i1 %166, float 0.000000e+00, float %174
  %176 = select i1 %165, float 0x7FF0000000000000, float %175
  %177 = fpext float %176 to double
  %178 = fadd contract double %177, 1.000000e+00
  %179 = fdiv contract double 1.000000e+00, %178
  %180 = fptrunc double %179 to float
  br label %181

181:                                              ; preds = %33, %155
  %182 = phi i64 [ %157, %155 ], [ %34, %33 ]
  %183 = phi float [ %180, %155 ], [ 0.000000e+00, %33 ]
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  store float %183, float addrspace(1)* %184, align 4, !tbaa !16
  %185 = getelementptr inbounds float, float addrspace(1)* %4, i64 %182
  store float %183, float addrspace(1)* %185, align 4, !tbaa !16
  br label %186

186:                                              ; preds = %181, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
