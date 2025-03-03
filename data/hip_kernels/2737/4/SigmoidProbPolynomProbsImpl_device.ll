; ModuleID = '../data/hip_kernels/2737/4/main.cu'
source_filename = "../data/hip_kernels/2737/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27SigmoidProbPolynomProbsImplPKfiPKiS0_S2_ifPf(float addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = icmp ult i32 %9, %1
  br i1 %10, label %11, label %219

11:                                               ; preds = %8
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = zext i32 %9 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = getelementptr inbounds float, float addrspace(1)* %7, i64 %13
  %16 = icmp slt i32 %12, %5
  br i1 %16, label %17, label %219

17:                                               ; preds = %11
  %18 = fneg contract float %6
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !5
  %23 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !14, !invariant.load !15
  %26 = zext i16 %25 to i32
  %27 = udiv i32 %22, %26
  %28 = mul i32 %27, %26
  %29 = icmp ugt i32 %22, %28
  %30 = zext i1 %29 to i32
  br label %31

31:                                               ; preds = %17, %101
  %32 = phi i32 [ %12, %17 ], [ %121, %101 ]
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !15
  %36 = add nsw i32 %32, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !15
  %40 = sub nsw i32 %39, %35
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %101

42:                                               ; preds = %31
  %43 = sext i32 %35 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %46 = add i32 %35, 1
  %47 = and i32 %40, 1
  %48 = icmp eq i32 %39, %46
  br i1 %48, label %51, label %49

49:                                               ; preds = %42
  %50 = and i32 %40, -2
  br label %123

51:                                               ; preds = %213, %42
  %52 = phi float [ undef, %42 ], [ %215, %213 ]
  %53 = phi float [ 0.000000e+00, %42 ], [ %215, %213 ]
  %54 = phi i32 [ 0, %42 ], [ %216, %213 ]
  %55 = icmp eq i32 %47, 0
  br i1 %55, label %101, label %56

56:                                               ; preds = %51
  %57 = zext i32 %54 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %44, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !15
  %60 = getelementptr inbounds float, float addrspace(1)* %45, i64 %57
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !20
  %62 = mul nsw i32 %59, %1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %14, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !20
  %66 = fsub contract float %65, %61
  %67 = fmul contract float %66, %18
  %68 = fmul float %67, 0x3FF7154760000000
  %69 = tail call float @llvm.rint.f32(float %68)
  %70 = fcmp ogt float %67, 0x40562E4300000000
  %71 = fcmp olt float %67, 0xC059D1DA00000000
  %72 = fneg float %68
  %73 = tail call float @llvm.fma.f32(float %67, float 0x3FF7154760000000, float %72)
  %74 = tail call float @llvm.fma.f32(float %67, float 0x3E54AE0BE0000000, float %73)
  %75 = fsub float %68, %69
  %76 = fadd float %74, %75
  %77 = tail call float @llvm.exp2.f32(float %76)
  %78 = fptosi float %69 to i32
  %79 = tail call float @llvm.amdgcn.ldexp.f32(float %77, i32 %78)
  %80 = fadd contract float %79, 1.000000e+00
  %81 = select i1 %71, float 1.000000e+00, float %80
  %82 = select i1 %70, float 0x7FF0000000000000, float %81
  %83 = tail call i1 @llvm.amdgcn.class.f32(float %82, i32 504)
  br i1 %83, label %84, label %98

84:                                               ; preds = %56
  %85 = tail call i1 @llvm.amdgcn.class.f32(float %82, i32 144)
  %86 = select i1 %85, float 0x41F0000000000000, float 1.000000e+00
  %87 = fmul float %82, %86
  %88 = tail call float @llvm.log2.f32(float %87)
  %89 = fmul float %88, 0x3FE62E42E0000000
  %90 = tail call i1 @llvm.amdgcn.class.f32(float %88, i32 519)
  %91 = fneg float %89
  %92 = tail call float @llvm.fma.f32(float %88, float 0x3FE62E42E0000000, float %91)
  %93 = tail call float @llvm.fma.f32(float %88, float 0x3E6EFA39E0000000, float %92)
  %94 = fadd float %89, %93
  %95 = select i1 %90, float %88, float %94
  %96 = select i1 %85, float 0x40362E4300000000, float 0.000000e+00
  %97 = fsub float %95, %96
  br label %98

98:                                               ; preds = %84, %56
  %99 = phi contract float [ %97, %84 ], [ %67, %56 ]
  %100 = fsub contract float %53, %99
  br label %101

101:                                              ; preds = %98, %51, %31
  %102 = phi float [ 0.000000e+00, %31 ], [ %52, %51 ], [ %100, %98 ]
  %103 = fmul float %102, 0x3FF7154760000000
  %104 = tail call float @llvm.rint.f32(float %103)
  %105 = fcmp ogt float %102, 0x40562E4300000000
  %106 = fcmp olt float %102, 0xC059D1DA00000000
  %107 = fneg float %103
  %108 = tail call float @llvm.fma.f32(float %102, float 0x3FF7154760000000, float %107)
  %109 = tail call float @llvm.fma.f32(float %102, float 0x3E54AE0BE0000000, float %108)
  %110 = fsub float %103, %104
  %111 = fadd float %109, %110
  %112 = tail call float @llvm.exp2.f32(float %111)
  %113 = fptosi float %104 to i32
  %114 = tail call float @llvm.amdgcn.ldexp.f32(float %112, i32 %113)
  %115 = select i1 %106, float 0.000000e+00, float %114
  %116 = select i1 %105, float 0x7FF0000000000000, float %115
  %117 = mul nsw i32 %32, %1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %15, i64 %118
  store float %116, float addrspace(1)* %119, align 4, !tbaa !20
  %120 = add i32 %27, %32
  %121 = add i32 %120, %30
  %122 = icmp slt i32 %121, %5
  br i1 %122, label %31, label %219, !llvm.loop !22

123:                                              ; preds = %213, %49
  %124 = phi float [ 0.000000e+00, %49 ], [ %215, %213 ]
  %125 = phi i32 [ 0, %49 ], [ %216, %213 ]
  %126 = phi i32 [ 0, %49 ], [ %217, %213 ]
  %127 = zext i32 %125 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %44, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !16, !amdgpu.noclobber !15
  %130 = getelementptr inbounds float, float addrspace(1)* %45, i64 %127
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !20
  %132 = mul nsw i32 %129, %1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %14, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !20
  %136 = fsub contract float %135, %131
  %137 = fmul contract float %136, %18
  %138 = fmul float %137, 0x3FF7154760000000
  %139 = tail call float @llvm.rint.f32(float %138)
  %140 = fcmp ogt float %137, 0x40562E4300000000
  %141 = fcmp olt float %137, 0xC059D1DA00000000
  %142 = fneg float %138
  %143 = tail call float @llvm.fma.f32(float %137, float 0x3FF7154760000000, float %142)
  %144 = tail call float @llvm.fma.f32(float %137, float 0x3E54AE0BE0000000, float %143)
  %145 = fsub float %138, %139
  %146 = fadd float %144, %145
  %147 = tail call float @llvm.exp2.f32(float %146)
  %148 = fptosi float %139 to i32
  %149 = tail call float @llvm.amdgcn.ldexp.f32(float %147, i32 %148)
  %150 = fadd contract float %149, 1.000000e+00
  %151 = select i1 %141, float 1.000000e+00, float %150
  %152 = select i1 %140, float 0x7FF0000000000000, float %151
  %153 = tail call i1 @llvm.amdgcn.class.f32(float %152, i32 504)
  br i1 %153, label %154, label %168

154:                                              ; preds = %123
  %155 = tail call i1 @llvm.amdgcn.class.f32(float %152, i32 144)
  %156 = select i1 %155, float 0x41F0000000000000, float 1.000000e+00
  %157 = fmul float %152, %156
  %158 = tail call float @llvm.log2.f32(float %157)
  %159 = fmul float %158, 0x3FE62E42E0000000
  %160 = tail call i1 @llvm.amdgcn.class.f32(float %158, i32 519)
  %161 = fneg float %159
  %162 = tail call float @llvm.fma.f32(float %158, float 0x3FE62E42E0000000, float %161)
  %163 = tail call float @llvm.fma.f32(float %158, float 0x3E6EFA39E0000000, float %162)
  %164 = fadd float %159, %163
  %165 = select i1 %160, float %158, float %164
  %166 = select i1 %155, float 0x40362E4300000000, float 0.000000e+00
  %167 = fsub float %165, %166
  br label %168

168:                                              ; preds = %123, %154
  %169 = phi contract float [ %167, %154 ], [ %137, %123 ]
  %170 = fsub contract float %124, %169
  %171 = or i32 %125, 1
  %172 = zext i32 %171 to i64
  %173 = getelementptr inbounds i32, i32 addrspace(1)* %44, i64 %172
  %174 = load i32, i32 addrspace(1)* %173, align 4, !tbaa !16, !amdgpu.noclobber !15
  %175 = getelementptr inbounds float, float addrspace(1)* %45, i64 %172
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !20
  %177 = mul nsw i32 %174, %1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %14, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !20
  %181 = fsub contract float %180, %176
  %182 = fmul contract float %181, %18
  %183 = fmul float %182, 0x3FF7154760000000
  %184 = tail call float @llvm.rint.f32(float %183)
  %185 = fcmp ogt float %182, 0x40562E4300000000
  %186 = fcmp olt float %182, 0xC059D1DA00000000
  %187 = fneg float %183
  %188 = tail call float @llvm.fma.f32(float %182, float 0x3FF7154760000000, float %187)
  %189 = tail call float @llvm.fma.f32(float %182, float 0x3E54AE0BE0000000, float %188)
  %190 = fsub float %183, %184
  %191 = fadd float %189, %190
  %192 = tail call float @llvm.exp2.f32(float %191)
  %193 = fptosi float %184 to i32
  %194 = tail call float @llvm.amdgcn.ldexp.f32(float %192, i32 %193)
  %195 = fadd contract float %194, 1.000000e+00
  %196 = select i1 %186, float 1.000000e+00, float %195
  %197 = select i1 %185, float 0x7FF0000000000000, float %196
  %198 = tail call i1 @llvm.amdgcn.class.f32(float %197, i32 504)
  br i1 %198, label %199, label %213

199:                                              ; preds = %168
  %200 = tail call i1 @llvm.amdgcn.class.f32(float %197, i32 144)
  %201 = select i1 %200, float 0x41F0000000000000, float 1.000000e+00
  %202 = fmul float %197, %201
  %203 = tail call float @llvm.log2.f32(float %202)
  %204 = fmul float %203, 0x3FE62E42E0000000
  %205 = tail call i1 @llvm.amdgcn.class.f32(float %203, i32 519)
  %206 = fneg float %204
  %207 = tail call float @llvm.fma.f32(float %203, float 0x3FE62E42E0000000, float %206)
  %208 = tail call float @llvm.fma.f32(float %203, float 0x3E6EFA39E0000000, float %207)
  %209 = fadd float %204, %208
  %210 = select i1 %205, float %203, float %209
  %211 = select i1 %200, float 0x40362E4300000000, float 0.000000e+00
  %212 = fsub float %210, %211
  br label %213

213:                                              ; preds = %199, %168
  %214 = phi contract float [ %212, %199 ], [ %182, %168 ]
  %215 = fsub contract float %170, %214
  %216 = add nuw nsw i32 %125, 2
  %217 = add i32 %126, 2
  %218 = icmp eq i32 %217, %50
  br i1 %218, label %51, label %123, !llvm.loop !24

219:                                              ; preds = %101, %11, %8
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
