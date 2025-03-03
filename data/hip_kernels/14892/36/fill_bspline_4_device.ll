; ModuleID = '../data/hip_kernels/14892/36/main.cu'
source_filename = "../data/hip_kernels/14892/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14fill_bspline_4PK15HIP_vector_typeIfLj4EEiPKfiiiPiS5_S5_PfS6_S6_S6_S6_S6_S6_(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture writeonly %9, float addrspace(1)* nocapture writeonly %10, float addrspace(1)* nocapture writeonly %11, float addrspace(1)* nocapture writeonly %12, float addrspace(1)* nocapture writeonly %13, float addrspace(1)* nocapture writeonly %14, float addrspace(1)* nocapture writeonly %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !6
  %26 = mul i32 %17, %22
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %27
  %29 = icmp ult i32 %28, %1
  br i1 %29, label %30, label %232

30:                                               ; preds = %16
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %33 = sitofp i32 %3 to float
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 3
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 4
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 5
  %37 = sitofp i32 %4 to float
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 6
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 7
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 8
  %41 = sitofp i32 %5 to float
  %42 = udiv i32 %25, %22
  %43 = mul i32 %42, %22
  %44 = icmp ugt i32 %25, %43
  %45 = zext i1 %44 to i32
  %46 = add i32 %42, %45
  %47 = mul i32 %46, %22
  br label %48

48:                                               ; preds = %30, %48
  %49 = phi i32 [ %28, %30 ], [ %230, %48 ]
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %50, i32 0, i32 0, i32 0, i64 0
  %52 = load float, float addrspace(1)* %51, align 16
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %50, i32 0, i32 0, i32 0, i64 1
  %54 = load float, float addrspace(1)* %53, align 4
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %50, i32 0, i32 0, i32 0, i64 2
  %56 = load float, float addrspace(1)* %55, align 8
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %50, i32 0, i32 0, i32 0, i64 3
  %58 = load float, float addrspace(1)* %57, align 4
  %59 = load float, float addrspace(1)* %2, align 4, !tbaa !16
  %60 = fmul contract float %52, %59
  %61 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %62 = fmul contract float %54, %61
  %63 = fadd contract float %60, %62
  %64 = load float, float addrspace(1)* %32, align 4, !tbaa !16
  %65 = fmul contract float %56, %64
  %66 = fadd contract float %63, %65
  %67 = fadd contract float %66, 2.000000e+00
  %68 = fadd contract float %67, 5.000000e-01
  %69 = tail call float @llvm.floor.f32(float %68)
  %70 = fadd contract float %69, -5.000000e-01
  %71 = fsub contract float %67, %70
  %72 = fmul contract float %71, %33
  %73 = load float, float addrspace(1)* %34, align 4, !tbaa !16
  %74 = fmul contract float %52, %73
  %75 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %76 = fmul contract float %54, %75
  %77 = fadd contract float %74, %76
  %78 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %79 = fmul contract float %56, %78
  %80 = fadd contract float %77, %79
  %81 = fadd contract float %80, 2.000000e+00
  %82 = fadd contract float %81, 5.000000e-01
  %83 = tail call float @llvm.floor.f32(float %82)
  %84 = fadd contract float %83, -5.000000e-01
  %85 = fsub contract float %81, %84
  %86 = fmul contract float %85, %37
  %87 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %88 = fmul contract float %52, %87
  %89 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %90 = fmul contract float %54, %89
  %91 = fadd contract float %88, %90
  %92 = load float, float addrspace(1)* %40, align 4, !tbaa !16
  %93 = fmul contract float %56, %92
  %94 = fadd contract float %91, %93
  %95 = fadd contract float %94, 2.000000e+00
  %96 = fadd contract float %95, 5.000000e-01
  %97 = tail call float @llvm.floor.f32(float %96)
  %98 = fadd contract float %97, -5.000000e-01
  %99 = fsub contract float %95, %98
  %100 = fmul contract float %99, %41
  %101 = fptosi float %72 to i32
  %102 = fptosi float %86 to i32
  %103 = fptosi float %100 to i32
  %104 = sitofp i32 %101 to float
  %105 = fsub contract float %72, %104
  %106 = sitofp i32 %102 to float
  %107 = fsub contract float %86, %106
  %108 = sitofp i32 %103 to float
  %109 = fsub contract float %100, %108
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %50
  store i32 %101, i32 addrspace(1)* %110, align 4, !tbaa !20
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %50
  store i32 %102, i32 addrspace(1)* %111, align 4, !tbaa !20
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %50
  store i32 %103, i32 addrspace(1)* %112, align 4, !tbaa !20
  %113 = getelementptr inbounds float, float addrspace(1)* %9, i64 %50
  store float %58, float addrspace(1)* %113, align 4, !tbaa !16
  %114 = fsub contract float 1.000000e+00, %105
  %115 = fsub contract float 1.000000e+00, %107
  %116 = fsub contract float 1.000000e+00, %109
  %117 = fmul contract float %105, 5.000000e-01
  %118 = fmul contract float %105, %117
  %119 = fmul contract float %107, 5.000000e-01
  %120 = fmul contract float %107, %119
  %121 = fmul contract float %109, 5.000000e-01
  %122 = fmul contract float %109, %121
  %123 = fadd contract float %105, 1.000000e+00
  %124 = fmul contract float %123, %114
  %125 = fsub contract float 2.000000e+00, %105
  %126 = fmul contract float %105, %125
  %127 = fadd contract float %124, %126
  %128 = fmul contract float %127, 5.000000e-01
  %129 = fadd contract float %107, 1.000000e+00
  %130 = fmul contract float %129, %115
  %131 = fsub contract float 2.000000e+00, %107
  %132 = fmul contract float %107, %131
  %133 = fadd contract float %130, %132
  %134 = fmul contract float %133, 5.000000e-01
  %135 = fadd contract float %109, 1.000000e+00
  %136 = fmul contract float %135, %116
  %137 = fsub contract float 2.000000e+00, %109
  %138 = fmul contract float %109, %137
  %139 = fadd contract float %136, %138
  %140 = fmul contract float %139, 5.000000e-01
  %141 = fmul contract float %114, 5.000000e-01
  %142 = fmul contract float %114, %141
  %143 = fmul contract float %115, 5.000000e-01
  %144 = fmul contract float %115, %143
  %145 = fmul contract float %116, 5.000000e-01
  %146 = fmul contract float %116, %145
  %147 = fneg contract float %142
  %148 = fneg contract float %144
  %149 = fneg contract float %146
  %150 = fsub contract float %142, %128
  %151 = fsub contract float %144, %134
  %152 = fsub contract float %146, %140
  %153 = fsub contract float %128, %118
  %154 = fsub contract float %134, %120
  %155 = fsub contract float %140, %122
  %156 = fmul contract float %105, 0x3FD5555560000000
  %157 = fmul contract float %156, %118
  %158 = fmul contract float %107, 0x3FD5555560000000
  %159 = fmul contract float %158, %120
  %160 = fmul contract float %109, 0x3FD5555560000000
  %161 = fmul contract float %160, %122
  %162 = fmul contract float %123, %128
  %163 = fsub contract float 3.000000e+00, %105
  %164 = fmul contract float %163, %118
  %165 = fadd contract float %164, %162
  %166 = fmul contract float %165, 0x3FD5555560000000
  %167 = fmul contract float %129, %134
  %168 = fsub contract float 3.000000e+00, %107
  %169 = fmul contract float %168, %120
  %170 = fadd contract float %169, %167
  %171 = fmul contract float %170, 0x3FD5555560000000
  %172 = fmul contract float %135, %140
  %173 = fsub contract float 3.000000e+00, %109
  %174 = fmul contract float %173, %122
  %175 = fadd contract float %174, %172
  %176 = fmul contract float %175, 0x3FD5555560000000
  %177 = fadd contract float %105, 2.000000e+00
  %178 = fmul contract float %177, %142
  %179 = fmul contract float %125, %128
  %180 = fadd contract float %178, %179
  %181 = fmul contract float %180, 0x3FD5555560000000
  %182 = fadd contract float %107, 2.000000e+00
  %183 = fmul contract float %182, %144
  %184 = fmul contract float %131, %134
  %185 = fadd contract float %183, %184
  %186 = fmul contract float %185, 0x3FD5555560000000
  %187 = fadd contract float %109, 2.000000e+00
  %188 = fmul contract float %187, %146
  %189 = fmul contract float %137, %140
  %190 = fadd contract float %188, %189
  %191 = fmul contract float %190, 0x3FD5555560000000
  %192 = fmul contract float %114, 0x3FD5555560000000
  %193 = fmul contract float %192, %142
  %194 = fmul contract float %115, 0x3FD5555560000000
  %195 = fmul contract float %194, %144
  %196 = fmul contract float %116, 0x3FD5555560000000
  %197 = fmul contract float %196, %146
  %198 = shl i32 %49, 2
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %10, i64 %199
  store float %193, float addrspace(1)* %200, align 4, !tbaa !16
  %201 = add nuw nsw i32 %198, 1
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %10, i64 %202
  store float %181, float addrspace(1)* %203, align 4, !tbaa !16
  %204 = add nuw nsw i32 %198, 2
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %10, i64 %205
  store float %166, float addrspace(1)* %206, align 4, !tbaa !16
  %207 = add nuw nsw i32 %198, 3
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %10, i64 %208
  store float %157, float addrspace(1)* %209, align 4, !tbaa !16
  %210 = getelementptr inbounds float, float addrspace(1)* %11, i64 %199
  store float %195, float addrspace(1)* %210, align 4, !tbaa !16
  %211 = getelementptr inbounds float, float addrspace(1)* %11, i64 %202
  store float %186, float addrspace(1)* %211, align 4, !tbaa !16
  %212 = getelementptr inbounds float, float addrspace(1)* %11, i64 %205
  store float %171, float addrspace(1)* %212, align 4, !tbaa !16
  %213 = getelementptr inbounds float, float addrspace(1)* %11, i64 %208
  store float %159, float addrspace(1)* %213, align 4, !tbaa !16
  %214 = getelementptr inbounds float, float addrspace(1)* %12, i64 %199
  store float %197, float addrspace(1)* %214, align 4, !tbaa !16
  %215 = getelementptr inbounds float, float addrspace(1)* %12, i64 %202
  store float %191, float addrspace(1)* %215, align 4, !tbaa !16
  %216 = getelementptr inbounds float, float addrspace(1)* %12, i64 %205
  store float %176, float addrspace(1)* %216, align 4, !tbaa !16
  %217 = getelementptr inbounds float, float addrspace(1)* %12, i64 %208
  store float %161, float addrspace(1)* %217, align 4, !tbaa !16
  %218 = getelementptr inbounds float, float addrspace(1)* %13, i64 %199
  store float %147, float addrspace(1)* %218, align 4, !tbaa !16
  %219 = getelementptr inbounds float, float addrspace(1)* %13, i64 %202
  store float %150, float addrspace(1)* %219, align 4, !tbaa !16
  %220 = getelementptr inbounds float, float addrspace(1)* %13, i64 %205
  store float %153, float addrspace(1)* %220, align 4, !tbaa !16
  %221 = getelementptr inbounds float, float addrspace(1)* %13, i64 %208
  store float %118, float addrspace(1)* %221, align 4, !tbaa !16
  %222 = getelementptr inbounds float, float addrspace(1)* %14, i64 %199
  store float %148, float addrspace(1)* %222, align 4, !tbaa !16
  %223 = getelementptr inbounds float, float addrspace(1)* %14, i64 %202
  store float %151, float addrspace(1)* %223, align 4, !tbaa !16
  %224 = getelementptr inbounds float, float addrspace(1)* %14, i64 %205
  store float %154, float addrspace(1)* %224, align 4, !tbaa !16
  %225 = getelementptr inbounds float, float addrspace(1)* %14, i64 %208
  store float %120, float addrspace(1)* %225, align 4, !tbaa !16
  %226 = getelementptr inbounds float, float addrspace(1)* %15, i64 %199
  store float %149, float addrspace(1)* %226, align 4, !tbaa !16
  %227 = getelementptr inbounds float, float addrspace(1)* %15, i64 %202
  store float %152, float addrspace(1)* %227, align 4, !tbaa !16
  %228 = getelementptr inbounds float, float addrspace(1)* %15, i64 %205
  store float %155, float addrspace(1)* %228, align 4, !tbaa !16
  %229 = getelementptr inbounds float, float addrspace(1)* %15, i64 %208
  store float %122, float addrspace(1)* %229, align 4, !tbaa !16
  %230 = add i32 %47, %49
  %231 = icmp ult i32 %230, %1
  br i1 %231, label %48, label %232, !llvm.loop !22

232:                                              ; preds = %48, %16
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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
