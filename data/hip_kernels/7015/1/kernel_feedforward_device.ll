; ModuleID = '../data/hip_kernels/7015/1/main.cu'
source_filename = "../data/hip_kernels/7015/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z18kernel_feedforwardiPiS_S_PfS0_S0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #1 {
  %8 = alloca i32, align 4, addrspace(5)
  %9 = addrspacecast i32 addrspace(5)* %8 to i32*
  %10 = bitcast i32 addrspace(5)* %8 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %10) #4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = mul i32 %17, %16
  %19 = add i32 %18, %11
  store volatile i32 %19, i32* %9, align 4, !tbaa !7
  %20 = sext i32 %0 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = add nsw i32 %0, -1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = load volatile i32, i32* %9, align 4, !tbaa !7
  %28 = add nsw i32 %22, -1
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %215

30:                                               ; preds = %7
  %31 = icmp sgt i32 %26, 0
  br i1 %31, label %32, label %66

32:                                               ; preds = %30
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %24
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %24
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = and i32 %26, 7
  %38 = icmp ult i32 %26, 8
  br i1 %38, label %41, label %39

39:                                               ; preds = %32
  %40 = and i32 %26, -8
  br label %97

41:                                               ; preds = %97, %32
  %42 = phi float [ undef, %32 ], [ %211, %97 ]
  %43 = phi i32 [ 0, %32 ], [ %212, %97 ]
  %44 = phi float [ 0.000000e+00, %32 ], [ %211, %97 ]
  %45 = icmp eq i32 %37, 0
  br i1 %45, label %66, label %46

46:                                               ; preds = %41, %46
  %47 = phi i32 [ %63, %46 ], [ %43, %41 ]
  %48 = phi float [ %62, %46 ], [ %44, %41 ]
  %49 = phi i32 [ %64, %46 ], [ 0, %41 ]
  %50 = mul nsw i32 %47, %28
  %51 = add nsw i32 %34, %50
  %52 = load volatile i32, i32* %9, align 4, !tbaa !7
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %6, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !11, !amdgpu.noclobber !6
  %57 = add nsw i32 %36, %47
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !11, !amdgpu.noclobber !6
  %61 = fmul contract float %56, %60
  %62 = fadd contract float %48, %61
  %63 = add nuw nsw i32 %47, 1
  %64 = add i32 %49, 1
  %65 = icmp eq i32 %64, %37
  br i1 %65, label %66, label %46, !llvm.loop !13

66:                                               ; preds = %41, %46, %30
  %67 = phi float [ 0.000000e+00, %30 ], [ %42, %41 ], [ %62, %46 ]
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %20
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = load volatile i32, i32* %9, align 4, !tbaa !7
  %71 = add nsw i32 %70, %69
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %4, i64 %72
  store float %67, float addrspace(1)* %73, align 4, !tbaa !11
  %74 = fneg contract float %67
  %75 = fmul float %67, 0xBFF7154760000000
  %76 = tail call float @llvm.rint.f32(float %75)
  %77 = fcmp olt float %67, 0xC0562E4300000000
  %78 = fcmp ogt float %67, 0x4059D1DA00000000
  %79 = fneg float %75
  %80 = tail call float @llvm.fma.f32(float %74, float 0x3FF7154760000000, float %79)
  %81 = tail call float @llvm.fma.f32(float %74, float 0x3E54AE0BE0000000, float %80)
  %82 = fsub float %75, %76
  %83 = fadd float %81, %82
  %84 = tail call float @llvm.exp2.f32(float %83)
  %85 = fptosi float %76 to i32
  %86 = tail call float @llvm.amdgcn.ldexp.f32(float %84, i32 %85)
  %87 = select i1 %78, float 0.000000e+00, float %86
  %88 = select i1 %77, float 0x7FF0000000000000, float %87
  %89 = fpext float %88 to double
  %90 = fadd contract double %89, 1.000000e+00
  %91 = fdiv contract double 1.000000e+00, %90
  %92 = fptrunc double %91 to float
  %93 = load volatile i32, i32* %9, align 4, !tbaa !7
  %94 = add nsw i32 %93, %69
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %5, i64 %95
  store float %92, float addrspace(1)* %96, align 4, !tbaa !11
  br label %215

97:                                               ; preds = %97, %39
  %98 = phi i32 [ 0, %39 ], [ %212, %97 ]
  %99 = phi float [ 0.000000e+00, %39 ], [ %211, %97 ]
  %100 = phi i32 [ 0, %39 ], [ %213, %97 ]
  %101 = mul nsw i32 %98, %28
  %102 = add nsw i32 %34, %101
  %103 = load volatile i32, i32* %9, align 4, !tbaa !7
  %104 = add nsw i32 %102, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %6, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !11, !amdgpu.noclobber !6
  %108 = add nsw i32 %36, %98
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %5, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !11, !amdgpu.noclobber !6
  %112 = fmul contract float %107, %111
  %113 = fadd contract float %99, %112
  %114 = or i32 %98, 1
  %115 = mul nsw i32 %114, %28
  %116 = add nsw i32 %34, %115
  %117 = load volatile i32, i32* %9, align 4, !tbaa !7
  %118 = add nsw i32 %116, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %6, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !11, !amdgpu.noclobber !6
  %122 = add nsw i32 %36, %114
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %5, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !11, !amdgpu.noclobber !6
  %126 = fmul contract float %121, %125
  %127 = fadd contract float %113, %126
  %128 = or i32 %98, 2
  %129 = mul nsw i32 %128, %28
  %130 = add nsw i32 %34, %129
  %131 = load volatile i32, i32* %9, align 4, !tbaa !7
  %132 = add nsw i32 %130, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %6, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !11, !amdgpu.noclobber !6
  %136 = add nsw i32 %36, %128
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %5, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !11, !amdgpu.noclobber !6
  %140 = fmul contract float %135, %139
  %141 = fadd contract float %127, %140
  %142 = or i32 %98, 3
  %143 = mul nsw i32 %142, %28
  %144 = add nsw i32 %34, %143
  %145 = load volatile i32, i32* %9, align 4, !tbaa !7
  %146 = add nsw i32 %144, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %6, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !11, !amdgpu.noclobber !6
  %150 = add nsw i32 %36, %142
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %5, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !11, !amdgpu.noclobber !6
  %154 = fmul contract float %149, %153
  %155 = fadd contract float %141, %154
  %156 = or i32 %98, 4
  %157 = mul nsw i32 %156, %28
  %158 = add nsw i32 %34, %157
  %159 = load volatile i32, i32* %9, align 4, !tbaa !7
  %160 = add nsw i32 %158, %159
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %6, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !11, !amdgpu.noclobber !6
  %164 = add nsw i32 %36, %156
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %5, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !11, !amdgpu.noclobber !6
  %168 = fmul contract float %163, %167
  %169 = fadd contract float %155, %168
  %170 = or i32 %98, 5
  %171 = mul nsw i32 %170, %28
  %172 = add nsw i32 %34, %171
  %173 = load volatile i32, i32* %9, align 4, !tbaa !7
  %174 = add nsw i32 %172, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %6, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !11, !amdgpu.noclobber !6
  %178 = add nsw i32 %36, %170
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %5, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !11, !amdgpu.noclobber !6
  %182 = fmul contract float %177, %181
  %183 = fadd contract float %169, %182
  %184 = or i32 %98, 6
  %185 = mul nsw i32 %184, %28
  %186 = add nsw i32 %34, %185
  %187 = load volatile i32, i32* %9, align 4, !tbaa !7
  %188 = add nsw i32 %186, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %6, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !11, !amdgpu.noclobber !6
  %192 = add nsw i32 %36, %184
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %5, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !11, !amdgpu.noclobber !6
  %196 = fmul contract float %191, %195
  %197 = fadd contract float %183, %196
  %198 = or i32 %98, 7
  %199 = mul nsw i32 %198, %28
  %200 = add nsw i32 %34, %199
  %201 = load volatile i32, i32* %9, align 4, !tbaa !7
  %202 = add nsw i32 %200, %201
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %6, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !11, !amdgpu.noclobber !6
  %206 = add nsw i32 %36, %198
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %5, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !11, !amdgpu.noclobber !6
  %210 = fmul contract float %205, %209
  %211 = fadd contract float %197, %210
  %212 = add nuw nsw i32 %98, 8
  %213 = add i32 %100, 8
  %214 = icmp eq i32 %213, %40
  br i1 %214, label %41, label %97, !llvm.loop !15

215:                                              ; preds = %7, %66
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %10) #4
  ret void
}

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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

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
