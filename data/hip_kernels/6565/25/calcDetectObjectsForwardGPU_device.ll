; ModuleID = '../data/hip_kernels/6565/25/main.cu'
source_filename = "../data/hip_kernels/6565/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27calcDetectObjectsForwardGPUPfS_iiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = icmp sgt i32 %5, 0
  br i1 %17, label %18, label %39

18:                                               ; preds = %7
  %19 = mul i32 %16, %15
  %20 = icmp ugt i32 %11, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %16, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = mul i32 %22, %23
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %26 = add i32 %24, %25
  %27 = mul i32 %26, %15
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = mul nsw i32 %3, %2
  %31 = mul nsw i32 %30, %4
  %32 = mul nsw i32 %31, %29
  %33 = icmp sgt i32 %6, 0
  %34 = add nsw i32 %6, 4
  %35 = and i32 %6, 1
  %36 = icmp eq i32 %6, 1
  %37 = and i32 %6, -2
  %38 = icmp eq i32 %35, 0
  br label %40

39:                                               ; preds = %151, %7
  ret void

40:                                               ; preds = %18, %151
  %41 = phi i32 [ 0, %18 ], [ %152, %151 ]
  %42 = add nsw i32 %41, %32
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %46 = fneg contract float %45
  %47 = fmul float %45, 0xBFF7154760000000
  %48 = tail call float @llvm.rint.f32(float %47)
  %49 = fcmp olt float %45, 0xC0562E4300000000
  %50 = fcmp ogt float %45, 0x4059D1DA00000000
  %51 = fneg float %47
  %52 = tail call float @llvm.fma.f32(float %46, float 0x3FF7154760000000, float %51)
  %53 = tail call float @llvm.fma.f32(float %46, float 0x3E54AE0BE0000000, float %52)
  %54 = fsub float %47, %48
  %55 = fadd float %53, %54
  %56 = tail call float @llvm.exp2.f32(float %55)
  %57 = fptosi float %48 to i32
  %58 = tail call float @llvm.amdgcn.ldexp.f32(float %56, i32 %57)
  %59 = fadd contract float %58, 1.000000e+00
  %60 = fdiv contract float 1.000000e+00, %59
  %61 = select i1 %50, float 1.000000e+00, float %60
  %62 = select i1 %49, float 0.000000e+00, float %61
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %62, float addrspace(1)* %63, align 4, !tbaa !16
  %64 = add nsw i32 %42, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = fneg contract float %67
  %69 = fmul float %67, 0xBFF7154760000000
  %70 = tail call float @llvm.rint.f32(float %69)
  %71 = fcmp olt float %67, 0xC0562E4300000000
  %72 = fcmp ogt float %67, 0x4059D1DA00000000
  %73 = fneg float %69
  %74 = tail call float @llvm.fma.f32(float %68, float 0x3FF7154760000000, float %73)
  %75 = tail call float @llvm.fma.f32(float %68, float 0x3E54AE0BE0000000, float %74)
  %76 = fsub float %69, %70
  %77 = fadd float %75, %76
  %78 = tail call float @llvm.exp2.f32(float %77)
  %79 = fptosi float %70 to i32
  %80 = tail call float @llvm.amdgcn.ldexp.f32(float %78, i32 %79)
  %81 = fadd contract float %80, 1.000000e+00
  %82 = fdiv contract float 1.000000e+00, %81
  %83 = select i1 %72, float 1.000000e+00, float %82
  %84 = select i1 %71, float 0.000000e+00, float %83
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  store float %84, float addrspace(1)* %85, align 4, !tbaa !16
  %86 = add nsw i32 %42, 2
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = fmul float %89, 0x3FF7154760000000
  %91 = tail call float @llvm.rint.f32(float %90)
  %92 = fcmp ogt float %89, 0x40562E4300000000
  %93 = fcmp olt float %89, 0xC059D1DA00000000
  %94 = fneg float %90
  %95 = tail call float @llvm.fma.f32(float %89, float 0x3FF7154760000000, float %94)
  %96 = tail call float @llvm.fma.f32(float %89, float 0x3E54AE0BE0000000, float %95)
  %97 = fsub float %90, %91
  %98 = fadd float %96, %97
  %99 = tail call float @llvm.exp2.f32(float %98)
  %100 = fptosi float %91 to i32
  %101 = tail call float @llvm.amdgcn.ldexp.f32(float %99, i32 %100)
  %102 = select i1 %93, float 0.000000e+00, float %101
  %103 = select i1 %92, float 0x7FF0000000000000, float %102
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  store float %103, float addrspace(1)* %104, align 4, !tbaa !16
  %105 = add nsw i32 %42, 3
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16
  %109 = fmul float %108, 0x3FF7154760000000
  %110 = tail call float @llvm.rint.f32(float %109)
  %111 = fcmp ogt float %108, 0x40562E4300000000
  %112 = fcmp olt float %108, 0xC059D1DA00000000
  %113 = fneg float %109
  %114 = tail call float @llvm.fma.f32(float %108, float 0x3FF7154760000000, float %113)
  %115 = tail call float @llvm.fma.f32(float %108, float 0x3E54AE0BE0000000, float %114)
  %116 = fsub float %109, %110
  %117 = fadd float %115, %116
  %118 = tail call float @llvm.exp2.f32(float %117)
  %119 = fptosi float %110 to i32
  %120 = tail call float @llvm.amdgcn.ldexp.f32(float %118, i32 %119)
  %121 = select i1 %112, float 0.000000e+00, float %120
  %122 = select i1 %111, float 0x7FF0000000000000, float %121
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  store float %122, float addrspace(1)* %123, align 4, !tbaa !16
  br i1 %33, label %124, label %151

124:                                              ; preds = %40
  %125 = add nsw i32 %42, 4
  br i1 %36, label %126, label %154

126:                                              ; preds = %154, %124
  %127 = phi i32 [ 0, %124 ], [ %202, %154 ]
  br i1 %38, label %151, label %128

128:                                              ; preds = %126
  %129 = add nsw i32 %125, %127
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16
  %133 = fneg contract float %132
  %134 = fmul float %132, 0xBFF7154760000000
  %135 = tail call float @llvm.rint.f32(float %134)
  %136 = fcmp olt float %132, 0xC0562E4300000000
  %137 = fcmp ogt float %132, 0x4059D1DA00000000
  %138 = fneg float %134
  %139 = tail call float @llvm.fma.f32(float %133, float 0x3FF7154760000000, float %138)
  %140 = tail call float @llvm.fma.f32(float %133, float 0x3E54AE0BE0000000, float %139)
  %141 = fsub float %134, %135
  %142 = fadd float %140, %141
  %143 = tail call float @llvm.exp2.f32(float %142)
  %144 = fptosi float %135 to i32
  %145 = tail call float @llvm.amdgcn.ldexp.f32(float %143, i32 %144)
  %146 = fadd contract float %145, 1.000000e+00
  %147 = fdiv contract float 1.000000e+00, %146
  %148 = select i1 %137, float 1.000000e+00, float %147
  %149 = select i1 %136, float 0.000000e+00, float %148
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  store float %149, float addrspace(1)* %150, align 4, !tbaa !16
  br label %151

151:                                              ; preds = %128, %126, %40
  %152 = add nsw i32 %34, %41
  %153 = icmp slt i32 %152, %5
  br i1 %153, label %40, label %39, !llvm.loop !20

154:                                              ; preds = %124, %154
  %155 = phi i32 [ %202, %154 ], [ 0, %124 ]
  %156 = phi i32 [ %203, %154 ], [ 0, %124 ]
  %157 = add nsw i32 %125, %155
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !16
  %161 = fneg contract float %160
  %162 = fmul float %160, 0xBFF7154760000000
  %163 = tail call float @llvm.rint.f32(float %162)
  %164 = fcmp olt float %160, 0xC0562E4300000000
  %165 = fcmp ogt float %160, 0x4059D1DA00000000
  %166 = fneg float %162
  %167 = tail call float @llvm.fma.f32(float %161, float 0x3FF7154760000000, float %166)
  %168 = tail call float @llvm.fma.f32(float %161, float 0x3E54AE0BE0000000, float %167)
  %169 = fsub float %162, %163
  %170 = fadd float %168, %169
  %171 = tail call float @llvm.exp2.f32(float %170)
  %172 = fptosi float %163 to i32
  %173 = tail call float @llvm.amdgcn.ldexp.f32(float %171, i32 %172)
  %174 = fadd contract float %173, 1.000000e+00
  %175 = fdiv contract float 1.000000e+00, %174
  %176 = select i1 %165, float 1.000000e+00, float %175
  %177 = select i1 %164, float 0.000000e+00, float %176
  %178 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  store float %177, float addrspace(1)* %178, align 4, !tbaa !16
  %179 = or i32 %155, 1
  %180 = add nsw i32 %125, %179
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %0, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !16
  %184 = fneg contract float %183
  %185 = fmul float %183, 0xBFF7154760000000
  %186 = tail call float @llvm.rint.f32(float %185)
  %187 = fcmp olt float %183, 0xC0562E4300000000
  %188 = fcmp ogt float %183, 0x4059D1DA00000000
  %189 = fneg float %185
  %190 = tail call float @llvm.fma.f32(float %184, float 0x3FF7154760000000, float %189)
  %191 = tail call float @llvm.fma.f32(float %184, float 0x3E54AE0BE0000000, float %190)
  %192 = fsub float %185, %186
  %193 = fadd float %191, %192
  %194 = tail call float @llvm.exp2.f32(float %193)
  %195 = fptosi float %186 to i32
  %196 = tail call float @llvm.amdgcn.ldexp.f32(float %194, i32 %195)
  %197 = fadd contract float %196, 1.000000e+00
  %198 = fdiv contract float 1.000000e+00, %197
  %199 = select i1 %188, float 1.000000e+00, float %198
  %200 = select i1 %187, float 0.000000e+00, float %199
  %201 = getelementptr inbounds float, float addrspace(1)* %1, i64 %181
  store float %200, float addrspace(1)* %201, align 4, !tbaa !16
  %202 = add nuw nsw i32 %155, 2
  %203 = add i32 %156, 2
  %204 = icmp eq i32 %203, %37
  br i1 %204, label %126, label %154, !llvm.loop !22
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
