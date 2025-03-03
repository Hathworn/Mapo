; ModuleID = '../data/hip_kernels/7015/3/main.cu'
source_filename = "../data/hip_kernels/7015/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z15kernel_calc_gjLiPiS_S_PfS0_S0_S0_S0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readnone %5, float addrspace(1)* nocapture readnone %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture readonly %8) local_unnamed_addr #1 {
  %10 = alloca i32, align 4, addrspace(5)
  %11 = addrspacecast i32 addrspace(5)* %10 to i32*
  %12 = bitcast i32 addrspace(5)* %10 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %12) #4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = mul i32 %19, %18
  %21 = add i32 %20, %13
  store volatile i32 %21, i32* %11, align 4, !tbaa !7
  %22 = sext i32 %0 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = add nsw i32 %0, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = load volatile i32, i32* %11, align 4, !tbaa !7
  %30 = add nsw i32 %24, -1
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %220

32:                                               ; preds = %9
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %22
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = load volatile i32, i32* %11, align 4, !tbaa !7
  %36 = add nsw i32 %35, %34
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %4, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !11, !amdgpu.noclobber !6
  %40 = fneg contract float %39
  %41 = fmul float %39, 0xBFF7154760000000
  %42 = tail call float @llvm.rint.f32(float %41)
  %43 = fcmp olt float %39, 0xC0562E4300000000
  %44 = fcmp ogt float %39, 0x4059D1DA00000000
  %45 = fneg float %41
  %46 = tail call float @llvm.fma.f32(float %40, float 0x3FF7154760000000, float %45)
  %47 = tail call float @llvm.fma.f32(float %40, float 0x3E54AE0BE0000000, float %46)
  %48 = fsub float %41, %42
  %49 = fadd float %47, %48
  %50 = tail call float @llvm.exp2.f32(float %49)
  %51 = fptosi float %42 to i32
  %52 = tail call float @llvm.amdgcn.ldexp.f32(float %50, i32 %51)
  %53 = select i1 %44, float 0.000000e+00, float %52
  %54 = select i1 %43, float 0x7FF0000000000000, float %53
  %55 = fadd contract float %54, 1.000000e+00
  %56 = fmul contract float %55, %55
  %57 = fdiv contract float %54, %56
  %58 = add i32 %28, -1
  %59 = icmp sgt i32 %28, 1
  br i1 %59, label %60, label %95

60:                                               ; preds = %32
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %22
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %26
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = add i32 %28, -2
  %66 = and i32 %58, 7
  %67 = icmp ult i32 %65, 7
  br i1 %67, label %70, label %68

68:                                               ; preds = %60
  %69 = and i32 %58, -8
  br label %102

70:                                               ; preds = %102, %60
  %71 = phi float [ undef, %60 ], [ %216, %102 ]
  %72 = phi i32 [ 0, %60 ], [ %217, %102 ]
  %73 = phi float [ 0.000000e+00, %60 ], [ %216, %102 ]
  %74 = icmp eq i32 %66, 0
  br i1 %74, label %95, label %75

75:                                               ; preds = %70, %75
  %76 = phi i32 [ %92, %75 ], [ %72, %70 ]
  %77 = phi float [ %91, %75 ], [ %73, %70 ]
  %78 = phi i32 [ %93, %75 ], [ 0, %70 ]
  %79 = load volatile i32, i32* %11, align 4, !tbaa !7
  %80 = mul nsw i32 %79, %58
  %81 = add i32 %62, %76
  %82 = add i32 %81, %80
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %8, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11, !amdgpu.noclobber !6
  %86 = add nsw i32 %64, %76
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %7, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !11, !amdgpu.noclobber !6
  %90 = fmul contract float %85, %89
  %91 = fadd contract float %77, %90
  %92 = add nuw nsw i32 %76, 1
  %93 = add i32 %78, 1
  %94 = icmp eq i32 %93, %66
  br i1 %94, label %95, label %75, !llvm.loop !13

95:                                               ; preds = %70, %75, %32
  %96 = phi float [ 0.000000e+00, %32 ], [ %71, %70 ], [ %91, %75 ]
  %97 = fmul contract float %57, %96
  %98 = load volatile i32, i32* %11, align 4, !tbaa !7
  %99 = add nsw i32 %98, %34
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %7, i64 %100
  store float %97, float addrspace(1)* %101, align 4, !tbaa !11
  br label %220

102:                                              ; preds = %102, %68
  %103 = phi i32 [ 0, %68 ], [ %217, %102 ]
  %104 = phi float [ 0.000000e+00, %68 ], [ %216, %102 ]
  %105 = phi i32 [ 0, %68 ], [ %218, %102 ]
  %106 = load volatile i32, i32* %11, align 4, !tbaa !7
  %107 = mul nsw i32 %106, %58
  %108 = add i32 %62, %103
  %109 = add i32 %108, %107
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %8, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !11, !amdgpu.noclobber !6
  %113 = add nsw i32 %64, %103
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %7, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !11, !amdgpu.noclobber !6
  %117 = fmul contract float %112, %116
  %118 = fadd contract float %104, %117
  %119 = or i32 %103, 1
  %120 = load volatile i32, i32* %11, align 4, !tbaa !7
  %121 = mul nsw i32 %120, %58
  %122 = add i32 %62, %119
  %123 = add i32 %122, %121
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %8, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !11, !amdgpu.noclobber !6
  %127 = add nsw i32 %64, %119
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %7, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !11, !amdgpu.noclobber !6
  %131 = fmul contract float %126, %130
  %132 = fadd contract float %118, %131
  %133 = or i32 %103, 2
  %134 = load volatile i32, i32* %11, align 4, !tbaa !7
  %135 = mul nsw i32 %134, %58
  %136 = add i32 %62, %133
  %137 = add i32 %136, %135
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %8, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !11, !amdgpu.noclobber !6
  %141 = add nsw i32 %64, %133
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %7, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !11, !amdgpu.noclobber !6
  %145 = fmul contract float %140, %144
  %146 = fadd contract float %132, %145
  %147 = or i32 %103, 3
  %148 = load volatile i32, i32* %11, align 4, !tbaa !7
  %149 = mul nsw i32 %148, %58
  %150 = add i32 %62, %147
  %151 = add i32 %150, %149
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %8, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !11, !amdgpu.noclobber !6
  %155 = add nsw i32 %64, %147
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %7, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !11, !amdgpu.noclobber !6
  %159 = fmul contract float %154, %158
  %160 = fadd contract float %146, %159
  %161 = or i32 %103, 4
  %162 = load volatile i32, i32* %11, align 4, !tbaa !7
  %163 = mul nsw i32 %162, %58
  %164 = add i32 %62, %161
  %165 = add i32 %164, %163
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %8, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !11, !amdgpu.noclobber !6
  %169 = add nsw i32 %64, %161
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %7, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !11, !amdgpu.noclobber !6
  %173 = fmul contract float %168, %172
  %174 = fadd contract float %160, %173
  %175 = or i32 %103, 5
  %176 = load volatile i32, i32* %11, align 4, !tbaa !7
  %177 = mul nsw i32 %176, %58
  %178 = add i32 %62, %175
  %179 = add i32 %178, %177
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %8, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !11, !amdgpu.noclobber !6
  %183 = add nsw i32 %64, %175
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %7, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !11, !amdgpu.noclobber !6
  %187 = fmul contract float %182, %186
  %188 = fadd contract float %174, %187
  %189 = or i32 %103, 6
  %190 = load volatile i32, i32* %11, align 4, !tbaa !7
  %191 = mul nsw i32 %190, %58
  %192 = add i32 %62, %189
  %193 = add i32 %192, %191
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %8, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !11, !amdgpu.noclobber !6
  %197 = add nsw i32 %64, %189
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %7, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !11, !amdgpu.noclobber !6
  %201 = fmul contract float %196, %200
  %202 = fadd contract float %188, %201
  %203 = or i32 %103, 7
  %204 = load volatile i32, i32* %11, align 4, !tbaa !7
  %205 = mul nsw i32 %204, %58
  %206 = add i32 %62, %203
  %207 = add i32 %206, %205
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %8, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !11, !amdgpu.noclobber !6
  %211 = add nsw i32 %64, %203
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds float, float addrspace(1)* %7, i64 %212
  %214 = load float, float addrspace(1)* %213, align 4, !tbaa !11, !amdgpu.noclobber !6
  %215 = fmul contract float %210, %214
  %216 = fadd contract float %202, %215
  %217 = add nuw nsw i32 %103, 8
  %218 = add i32 %105, 8
  %219 = icmp eq i32 %218, %69
  br i1 %219, label %70, label %102, !llvm.loop !15

220:                                              ; preds = %9, %95
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %12) #4
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
