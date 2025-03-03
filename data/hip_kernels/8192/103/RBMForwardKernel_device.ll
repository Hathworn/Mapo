; ModuleID = '../data/hip_kernels/8192/103/main.cu'
source_filename = "../data/hip_kernels/8192/103/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16RBMForwardKernelPfS_S_S_fiibbfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, i32 %5, i32 %6, i1 %7, i1 %8, float %9, float addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = udiv i32 %19, %16
  %23 = mul i32 %22, %16
  %24 = icmp ugt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %20
  %30 = mul i32 %29, %16
  %31 = add i32 %30, %28
  %32 = icmp slt i32 %31, %6
  br i1 %32, label %33, label %193

33:                                               ; preds = %11
  %34 = xor i1 %8, true
  %35 = select i1 %8, i1 %7, i1 false
  br i1 %35, label %36, label %41

36:                                               ; preds = %33
  %37 = sext i32 %31 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %10, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !5
  %40 = fcmp contract une float %39, 0.000000e+00
  br i1 %40, label %41, label %189

41:                                               ; preds = %33, %36
  %42 = icmp sgt i32 %5, 0
  br i1 %42, label %43, label %158

43:                                               ; preds = %41
  %44 = and i32 %5, 7
  %45 = icmp ult i32 %5, 8
  br i1 %45, label %135, label %46

46:                                               ; preds = %43
  %47 = and i32 %5, -8
  br label %48

48:                                               ; preds = %48, %46
  %49 = phi i32 [ %31, %46 ], [ %131, %48 ]
  %50 = phi float [ 0.000000e+00, %46 ], [ %130, %48 ]
  %51 = phi i32 [ 0, %46 ], [ %132, %48 ]
  %52 = phi i32 [ 0, %46 ], [ %133, %48 ]
  %53 = sext i32 %49 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16, !amdgpu.noclobber !5
  %56 = zext i32 %51 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16, !amdgpu.noclobber !5
  %59 = fmul contract float %55, %58
  %60 = fadd contract float %50, %59
  %61 = add nsw i32 %49, %6
  %62 = or i32 %51, 1
  %63 = sext i32 %61 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !5
  %66 = zext i32 %62 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16, !amdgpu.noclobber !5
  %69 = fmul contract float %65, %68
  %70 = fadd contract float %60, %69
  %71 = add nsw i32 %61, %6
  %72 = or i32 %51, 2
  %73 = sext i32 %71 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16, !amdgpu.noclobber !5
  %76 = zext i32 %72 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16, !amdgpu.noclobber !5
  %79 = fmul contract float %75, %78
  %80 = fadd contract float %70, %79
  %81 = add nsw i32 %71, %6
  %82 = or i32 %51, 3
  %83 = sext i32 %81 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16, !amdgpu.noclobber !5
  %86 = zext i32 %82 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16, !amdgpu.noclobber !5
  %89 = fmul contract float %85, %88
  %90 = fadd contract float %80, %89
  %91 = add nsw i32 %81, %6
  %92 = or i32 %51, 4
  %93 = sext i32 %91 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16, !amdgpu.noclobber !5
  %96 = zext i32 %92 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16, !amdgpu.noclobber !5
  %99 = fmul contract float %95, %98
  %100 = fadd contract float %90, %99
  %101 = add nsw i32 %91, %6
  %102 = or i32 %51, 5
  %103 = sext i32 %101 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !5
  %106 = zext i32 %102 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16, !amdgpu.noclobber !5
  %109 = fmul contract float %105, %108
  %110 = fadd contract float %100, %109
  %111 = add nsw i32 %101, %6
  %112 = or i32 %51, 6
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %2, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16, !amdgpu.noclobber !5
  %116 = zext i32 %112 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !16, !amdgpu.noclobber !5
  %119 = fmul contract float %115, %118
  %120 = fadd contract float %110, %119
  %121 = add nsw i32 %111, %6
  %122 = or i32 %51, 7
  %123 = sext i32 %121 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16, !amdgpu.noclobber !5
  %126 = zext i32 %122 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16, !amdgpu.noclobber !5
  %129 = fmul contract float %125, %128
  %130 = fadd contract float %120, %129
  %131 = add nsw i32 %121, %6
  %132 = add nuw nsw i32 %51, 8
  %133 = add i32 %52, 8
  %134 = icmp eq i32 %133, %47
  br i1 %134, label %135, label %48, !llvm.loop !20

135:                                              ; preds = %48, %43
  %136 = phi float [ undef, %43 ], [ %130, %48 ]
  %137 = phi i32 [ %31, %43 ], [ %131, %48 ]
  %138 = phi float [ 0.000000e+00, %43 ], [ %130, %48 ]
  %139 = phi i32 [ 0, %43 ], [ %132, %48 ]
  %140 = icmp eq i32 %44, 0
  br i1 %140, label %158, label %141

141:                                              ; preds = %135, %141
  %142 = phi i32 [ %154, %141 ], [ %137, %135 ]
  %143 = phi float [ %153, %141 ], [ %138, %135 ]
  %144 = phi i32 [ %155, %141 ], [ %139, %135 ]
  %145 = phi i32 [ %156, %141 ], [ 0, %135 ]
  %146 = sext i32 %142 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16, !amdgpu.noclobber !5
  %149 = zext i32 %144 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !16, !amdgpu.noclobber !5
  %152 = fmul contract float %148, %151
  %153 = fadd contract float %143, %152
  %154 = add nsw i32 %142, %6
  %155 = add nuw nsw i32 %144, 1
  %156 = add i32 %145, 1
  %157 = icmp eq i32 %156, %44
  br i1 %157, label %158, label %141, !llvm.loop !22

158:                                              ; preds = %135, %141, %41
  %159 = phi float [ 0.000000e+00, %41 ], [ %136, %135 ], [ %153, %141 ]
  %160 = sext i32 %31 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %3, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !16, !amdgpu.noclobber !5
  %163 = fadd contract float %159, %162
  %164 = fneg contract float %4
  %165 = fmul contract float %163, %164
  %166 = fmul float %165, 0x3FF7154760000000
  %167 = tail call float @llvm.rint.f32(float %166)
  %168 = fcmp ogt float %165, 0x40562E4300000000
  %169 = fcmp olt float %165, 0xC059D1DA00000000
  %170 = fneg float %166
  %171 = tail call float @llvm.fma.f32(float %165, float 0x3FF7154760000000, float %170)
  %172 = tail call float @llvm.fma.f32(float %165, float 0x3E54AE0BE0000000, float %171)
  %173 = fsub float %166, %167
  %174 = fadd float %172, %173
  %175 = tail call float @llvm.exp2.f32(float %174)
  %176 = fptosi float %167 to i32
  %177 = tail call float @llvm.amdgcn.ldexp.f32(float %175, i32 %176)
  %178 = select i1 %169, float 0.000000e+00, float %177
  %179 = select i1 %168, float 0x7FF0000000000000, float %178
  %180 = fpext float %179 to double
  %181 = fadd contract double %180, 1.000000e+00
  %182 = fdiv contract double 1.000000e+00, %181
  %183 = fptrunc double %182 to float
  %184 = fcmp contract uge float %9, 1.000000e+00
  %185 = select i1 %34, i1 true, i1 %7
  %186 = select i1 %185, i1 true, i1 %184
  %187 = select i1 %186, float 1.000000e+00, float %9
  %188 = fdiv contract float %183, %187
  br label %189

189:                                              ; preds = %36, %158
  %190 = phi i64 [ %160, %158 ], [ %37, %36 ]
  %191 = phi float [ %188, %158 ], [ 0.000000e+00, %36 ]
  %192 = getelementptr inbounds float, float addrspace(1)* %1, i64 %190
  store float %191, float addrspace(1)* %192, align 4, !tbaa !16
  br label %193

193:                                              ; preds = %189, %11
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
