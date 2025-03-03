; ModuleID = '../data/hip_kernels/9329/22/main.cu'
source_filename = "../data/hip_kernels/9329/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15variance_kernelPfS_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = mul nsw i32 %4, %2
  %8 = add nsw i32 %7, -1
  %9 = sitofp i32 %8 to float
  %10 = fdiv contract float 1.000000e+00, %9
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !13, !invariant.load !14
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %11
  %28 = mul i32 %27, %20
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %30 = add i32 %28, %29
  %31 = icmp slt i32 %30, %3
  br i1 %31, label %32, label %217

32:                                               ; preds = %6
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %5, i64 %33
  store float 0.000000e+00, float addrspace(1)* %34, align 4, !tbaa !16
  %35 = icmp sgt i32 %2, 0
  br i1 %35, label %36, label %214

36:                                               ; preds = %32
  %37 = icmp sgt i32 %4, 0
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  br label %39

39:                                               ; preds = %36, %210
  %40 = phi float [ 0.000000e+00, %36 ], [ %211, %210 ]
  %41 = phi i32 [ 0, %36 ], [ %212, %210 ]
  br i1 %37, label %42, label %210

42:                                               ; preds = %39
  %43 = mul nsw i32 %41, %3
  %44 = add i32 %43, %30
  %45 = mul i32 %44, %4
  br label %46

46:                                               ; preds = %42, %46
  %47 = phi i32 [ 0, %42 ], [ %208, %46 ]
  %48 = add nsw i32 %47, %45
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %53 = fsub contract float %51, %52
  %54 = tail call float @llvm.fabs.f32(float %53)
  %55 = tail call float @llvm.amdgcn.frexp.mant.f32(float %54)
  %56 = fcmp olt float %55, 0x3FE5555560000000
  %57 = zext i1 %56 to i32
  %58 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 %57)
  %59 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %54)
  %60 = sub nsw i32 %59, %57
  %61 = fadd float %58, -1.000000e+00
  %62 = fadd float %58, 1.000000e+00
  %63 = fadd float %62, -1.000000e+00
  %64 = fsub float %58, %63
  %65 = tail call float @llvm.amdgcn.rcp.f32(float %62)
  %66 = fmul float %61, %65
  %67 = fmul float %62, %66
  %68 = fneg float %67
  %69 = tail call float @llvm.fma.f32(float %66, float %62, float %68)
  %70 = tail call float @llvm.fma.f32(float %66, float %64, float %69)
  %71 = fadd float %67, %70
  %72 = fsub float %71, %67
  %73 = fsub float %70, %72
  %74 = fsub float %61, %71
  %75 = fsub float %61, %74
  %76 = fsub float %75, %71
  %77 = fsub float %76, %73
  %78 = fadd float %74, %77
  %79 = fmul float %65, %78
  %80 = fadd float %66, %79
  %81 = fsub float %80, %66
  %82 = fsub float %79, %81
  %83 = fmul float %80, %80
  %84 = fneg float %83
  %85 = tail call float @llvm.fma.f32(float %80, float %80, float %84)
  %86 = fmul float %82, 2.000000e+00
  %87 = tail call float @llvm.fma.f32(float %80, float %86, float %85)
  %88 = fadd float %83, %87
  %89 = fsub float %88, %83
  %90 = fsub float %87, %89
  %91 = tail call float @llvm.fmuladd.f32(float %88, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %92 = tail call float @llvm.fmuladd.f32(float %88, float %91, float 0x3FD999BDE0000000)
  %93 = sitofp i32 %60 to float
  %94 = fmul float %93, 0x3FE62E4300000000
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %93, float 0x3FE62E4300000000, float %95)
  %97 = tail call float @llvm.fma.f32(float %93, float 0xBE205C6100000000, float %96)
  %98 = fadd float %94, %97
  %99 = fsub float %98, %94
  %100 = fsub float %97, %99
  %101 = tail call float @llvm.amdgcn.ldexp.f32(float %80, i32 1)
  %102 = fmul float %80, %88
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %88, float %80, float %103)
  %105 = tail call float @llvm.fma.f32(float %88, float %82, float %104)
  %106 = tail call float @llvm.fma.f32(float %90, float %80, float %105)
  %107 = fadd float %102, %106
  %108 = fsub float %107, %102
  %109 = fsub float %106, %108
  %110 = fmul float %88, %92
  %111 = fneg float %110
  %112 = tail call float @llvm.fma.f32(float %88, float %92, float %111)
  %113 = tail call float @llvm.fma.f32(float %90, float %92, float %112)
  %114 = fadd float %110, %113
  %115 = fsub float %114, %110
  %116 = fsub float %113, %115
  %117 = fadd float %114, 0x3FE5555540000000
  %118 = fadd float %117, 0xBFE5555540000000
  %119 = fsub float %114, %118
  %120 = fadd float %116, 0x3E2E720200000000
  %121 = fadd float %120, %119
  %122 = fadd float %117, %121
  %123 = fsub float %122, %117
  %124 = fsub float %121, %123
  %125 = fmul float %107, %122
  %126 = fneg float %125
  %127 = tail call float @llvm.fma.f32(float %107, float %122, float %126)
  %128 = tail call float @llvm.fma.f32(float %107, float %124, float %127)
  %129 = tail call float @llvm.fma.f32(float %109, float %122, float %128)
  %130 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 1)
  %131 = fadd float %125, %129
  %132 = fsub float %131, %125
  %133 = fsub float %129, %132
  %134 = fadd float %101, %131
  %135 = fsub float %134, %101
  %136 = fsub float %131, %135
  %137 = fadd float %130, %133
  %138 = fadd float %137, %136
  %139 = fadd float %134, %138
  %140 = fsub float %139, %134
  %141 = fsub float %138, %140
  %142 = fadd float %98, %139
  %143 = fsub float %142, %98
  %144 = fsub float %142, %143
  %145 = fsub float %98, %144
  %146 = fsub float %139, %143
  %147 = fadd float %146, %145
  %148 = fadd float %100, %141
  %149 = fsub float %148, %100
  %150 = fsub float %148, %149
  %151 = fsub float %100, %150
  %152 = fsub float %141, %149
  %153 = fadd float %152, %151
  %154 = fadd float %148, %147
  %155 = fadd float %142, %154
  %156 = fsub float %155, %142
  %157 = fsub float %154, %156
  %158 = fadd float %153, %157
  %159 = fadd float %155, %158
  %160 = fsub float %159, %155
  %161 = fsub float %158, %160
  %162 = fmul float %159, 2.000000e+00
  %163 = fneg float %162
  %164 = tail call float @llvm.fma.f32(float %159, float 2.000000e+00, float %163)
  %165 = tail call float @llvm.fma.f32(float %161, float 2.000000e+00, float %164)
  %166 = fadd float %162, %165
  %167 = fsub float %166, %162
  %168 = fsub float %165, %167
  %169 = tail call float @llvm.fabs.f32(float %162) #3
  %170 = fcmp oeq float %169, 0x7FF0000000000000
  %171 = select i1 %170, float %162, float %166
  %172 = tail call float @llvm.fabs.f32(float %171) #3
  %173 = fcmp oeq float %172, 0x7FF0000000000000
  %174 = select i1 %173, float 0.000000e+00, float %168
  %175 = fcmp oeq float %171, 0x40562E4300000000
  %176 = select i1 %175, float 0x3EE0000000000000, float 0.000000e+00
  %177 = fsub float %171, %176
  %178 = fadd float %176, %174
  %179 = fmul float %177, 0x3FF7154760000000
  %180 = tail call float @llvm.rint.f32(float %179)
  %181 = fcmp ogt float %177, 0x40562E4300000000
  %182 = fcmp olt float %177, 0xC059D1DA00000000
  %183 = fneg float %179
  %184 = tail call float @llvm.fma.f32(float %177, float 0x3FF7154760000000, float %183)
  %185 = tail call float @llvm.fma.f32(float %177, float 0x3E54AE0BE0000000, float %184)
  %186 = fsub float %179, %180
  %187 = fadd float %185, %186
  %188 = tail call float @llvm.exp2.f32(float %187)
  %189 = fptosi float %180 to i32
  %190 = tail call float @llvm.amdgcn.ldexp.f32(float %188, i32 %189)
  %191 = select i1 %182, float 0.000000e+00, float %190
  %192 = select i1 %181, float 0x7FF0000000000000, float %191
  %193 = tail call float @llvm.fma.f32(float %192, float %178, float %192)
  %194 = tail call float @llvm.fabs.f32(float %192) #3
  %195 = fcmp oeq float %194, 0x7FF0000000000000
  %196 = select i1 %195, float %192, float %193
  %197 = tail call float @llvm.fabs.f32(float %196)
  %198 = fcmp oeq float %54, 0x7FF0000000000000
  %199 = fcmp oeq float %53, 0.000000e+00
  %200 = select i1 %198, float 0x7FF0000000000000, float %197
  %201 = select i1 %199, float 0.000000e+00, float %200
  %202 = fcmp uno float %53, 0.000000e+00
  %203 = select i1 %202, float 0x7FF8000000000000, float %201
  %204 = fcmp oeq float %53, 1.000000e+00
  %205 = select i1 %204, float 1.000000e+00, float %203
  %206 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %207 = fadd contract float %206, %205
  store float %207, float addrspace(1)* %34, align 4, !tbaa !16
  %208 = add nuw nsw i32 %47, 1
  %209 = icmp eq i32 %208, %4
  br i1 %209, label %210, label %46, !llvm.loop !20

210:                                              ; preds = %46, %39
  %211 = phi float [ %40, %39 ], [ %207, %46 ]
  %212 = add nuw nsw i32 %41, 1
  %213 = icmp eq i32 %212, %2
  br i1 %213, label %214, label %39, !llvm.loop !22

214:                                              ; preds = %210, %32
  %215 = phi float [ 0.000000e+00, %32 ], [ %211, %210 ]
  %216 = fmul contract float %10, %215
  store float %216, float addrspace(1)* %34, align 4, !tbaa !16
  br label %217

217:                                              ; preds = %6, %214
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
