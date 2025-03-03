; ModuleID = '../data/hip_kernels/1594/55/main.cu'
source_filename = "../data/hip_kernels/1594/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19levels_image_kernelPfS_iiiifffff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float %6, float %7, float %8, float %9, float %10) local_unnamed_addr #0 {
  %12 = mul i32 %4, %3
  %13 = mul i32 %12, %2
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !4
  %20 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !13, !invariant.load !14
  %23 = zext i16 %22 to i32
  %24 = udiv i32 %19, %23
  %25 = mul i32 %24, %23
  %26 = icmp ugt i32 %19, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %15
  %30 = add i32 %29, %14
  %31 = mul i32 %30, %23
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %33 = add i32 %31, %32
  %34 = icmp slt i32 %33, %13
  br i1 %34, label %35, label %198

35:                                               ; preds = %11
  %36 = freeze i32 %33
  %37 = freeze i32 %3
  %38 = sdiv i32 %36, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %36, %39
  %41 = freeze i32 %4
  %42 = sdiv i32 %38, %41
  %43 = mul i32 %42, %41
  %44 = sub i32 %38, %43
  %45 = load float, float addrspace(1)* %1, align 4, !tbaa !16, !amdgpu.noclobber !14
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !14
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !14
  %50 = shl nsw i32 %42, 3
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !14
  %54 = add nuw nsw i32 %50, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16, !amdgpu.noclobber !14
  %58 = add nuw nsw i32 %50, 2
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16, !amdgpu.noclobber !14
  %62 = add nuw nsw i32 %50, 3
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !14
  %66 = fadd contract float %6, -1.000000e+00
  %67 = fmul contract float %66, %53
  %68 = fadd contract float %67, 1.000000e+00
  %69 = fcmp contract ogt float %57, 5.000000e-01
  %70 = fdiv contract float 1.000000e+00, %68
  %71 = select contract i1 %69, float %70, float %68
  %72 = fadd contract float %7, -1.000000e+00
  %73 = fmul contract float %72, %61
  %74 = fadd contract float %73, 1.000000e+00
  %75 = fcmp contract ogt float %65, 5.000000e-01
  %76 = fdiv contract float 1.000000e+00, %74
  %77 = select contract i1 %75, float %76, float %74
  %78 = mul i32 %12, 3
  %79 = mul i32 %78, %42
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = mul nsw i32 %44, %3
  %83 = add nsw i32 %82, %40
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %81, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16, !amdgpu.noclobber !14
  %87 = add nsw i32 %44, %4
  %88 = mul nsw i32 %87, %3
  %89 = add nsw i32 %88, %40
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %81, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !14
  %93 = shl nsw i32 %4, 1
  %94 = add nsw i32 %44, %93
  %95 = mul nsw i32 %94, %3
  %96 = add nsw i32 %95, %40
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %81, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16, !amdgpu.noclobber !14
  %100 = icmp eq i32 %5, 0
  br i1 %100, label %178, label %101

101:                                              ; preds = %35
  %102 = fcmp contract ogt float %86, %92
  %103 = fcmp contract ogt float %86, %99
  %104 = select contract i1 %103, float %86, float %99
  %105 = fcmp contract ogt float %92, %99
  %106 = select contract i1 %105, float %92, float %99
  %107 = select contract i1 %102, float %104, float %106
  %108 = fcmp contract olt float %86, %92
  %109 = fcmp contract olt float %86, %99
  %110 = select contract i1 %109, float %86, float %99
  %111 = fcmp contract olt float %92, %99
  %112 = select contract i1 %111, float %92, float %99
  %113 = select contract i1 %108, float %110, float %112
  %114 = fsub contract float %107, %113
  %115 = fcmp contract oeq float %107, 0.000000e+00
  br i1 %115, label %137, label %116

116:                                              ; preds = %101
  %117 = fdiv contract float %114, %107
  %118 = fcmp contract oeq float %86, %107
  br i1 %118, label %119, label %122

119:                                              ; preds = %116
  %120 = fsub contract float %92, %99
  %121 = fdiv contract float %120, %114
  br label %132

122:                                              ; preds = %116
  %123 = fcmp contract oeq float %92, %107
  br i1 %123, label %124, label %128

124:                                              ; preds = %122
  %125 = fsub contract float %99, %86
  %126 = fdiv contract float %125, %114
  %127 = fadd contract float %126, 2.000000e+00
  br label %132

128:                                              ; preds = %122
  %129 = fsub contract float %86, %92
  %130 = fdiv contract float %129, %114
  %131 = fadd contract float %130, 4.000000e+00
  br label %132

132:                                              ; preds = %128, %124, %119
  %133 = phi float [ %121, %119 ], [ %127, %124 ], [ %131, %128 ]
  %134 = fcmp contract olt float %133, 0.000000e+00
  %135 = fadd contract float %133, 6.000000e+00
  %136 = select i1 %134, float %135, float %133
  br label %137

137:                                              ; preds = %101, %132
  %138 = phi float [ 0.000000e+00, %101 ], [ %117, %132 ]
  %139 = phi float [ -1.000000e+00, %101 ], [ %136, %132 ]
  %140 = fmul contract float %71, %138
  %141 = fmul contract float %77, %107
  %142 = fcmp contract oeq float %140, 0.000000e+00
  br i1 %142, label %162, label %143

143:                                              ; preds = %137
  %144 = tail call float @llvm.floor.f32(float %139)
  %145 = fptosi float %144 to i32
  %146 = sitofp i32 %145 to float
  %147 = fsub contract float %139, %146
  %148 = fsub contract float 1.000000e+00, %140
  %149 = fmul contract float %141, %148
  %150 = fmul contract float %140, %147
  %151 = fsub contract float 1.000000e+00, %150
  %152 = fmul contract float %141, %151
  %153 = fsub contract float 1.000000e+00, %147
  %154 = fmul contract float %140, %153
  %155 = fsub contract float 1.000000e+00, %154
  %156 = fmul contract float %141, %155
  switch i32 %145, label %161 [
    i32 0, label %162
    i32 1, label %157
    i32 2, label %158
    i32 3, label %159
    i32 4, label %160
  ]

157:                                              ; preds = %143
  br label %162

158:                                              ; preds = %143
  br label %162

159:                                              ; preds = %143
  br label %162

160:                                              ; preds = %143
  br label %162

161:                                              ; preds = %143
  br label %162

162:                                              ; preds = %137, %143, %157, %158, %159, %160, %161
  %163 = phi float [ %141, %137 ], [ %149, %157 ], [ %156, %158 ], [ %141, %159 ], [ %141, %160 ], [ %152, %161 ], [ %149, %143 ]
  %164 = phi float [ %141, %137 ], [ %141, %157 ], [ %141, %158 ], [ %152, %159 ], [ %149, %160 ], [ %149, %161 ], [ %156, %143 ]
  %165 = phi float [ %141, %137 ], [ %152, %157 ], [ %149, %158 ], [ %149, %159 ], [ %156, %160 ], [ %141, %161 ], [ %141, %143 ]
  %166 = fcmp contract olt float %165, 0.000000e+00
  %167 = fcmp contract ogt float %165, 1.000000e+00
  %168 = select contract i1 %167, float 1.000000e+00, float %165
  %169 = select contract i1 %166, float 0.000000e+00, float %168
  %170 = fcmp contract olt float %164, 0.000000e+00
  %171 = fcmp contract ogt float %164, 1.000000e+00
  %172 = select contract i1 %171, float 1.000000e+00, float %164
  %173 = select contract i1 %170, float 0.000000e+00, float %172
  %174 = fcmp contract olt float %163, 0.000000e+00
  %175 = fcmp contract ogt float %163, 1.000000e+00
  %176 = select contract i1 %175, float 1.000000e+00, float %163
  %177 = select contract i1 %174, float 0.000000e+00, float %176
  br label %178

178:                                              ; preds = %35, %162
  %179 = phi float [ %169, %162 ], [ %86, %35 ]
  %180 = phi float [ %173, %162 ], [ %92, %35 ]
  %181 = phi float [ %177, %162 ], [ %99, %35 ]
  %182 = phi float [ %10, %162 ], [ 0.000000e+00, %35 ]
  %183 = fmul contract float %179, %9
  %184 = fadd contract float %183, %8
  %185 = fadd contract float %45, -5.000000e-01
  %186 = fmul contract float %185, %182
  %187 = fadd contract float %184, %186
  store float %187, float addrspace(1)* %85, align 4, !tbaa !16
  %188 = fmul contract float %180, %9
  %189 = fadd contract float %188, %8
  %190 = fadd contract float %47, -5.000000e-01
  %191 = fmul contract float %190, %182
  %192 = fadd contract float %189, %191
  store float %192, float addrspace(1)* %91, align 4, !tbaa !16
  %193 = fmul contract float %181, %9
  %194 = fadd contract float %193, %8
  %195 = fadd contract float %49, -5.000000e-01
  %196 = fmul contract float %195, %182
  %197 = fadd contract float %194, %196
  store float %197, float addrspace(1)* %98, align 4, !tbaa !16
  br label %198

198:                                              ; preds = %11, %178
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
