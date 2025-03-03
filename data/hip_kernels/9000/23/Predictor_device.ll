; ModuleID = '../data/hip_kernels/9000/23/main.cu'
source_filename = "../data/hip_kernels/9000/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9PredictordP15HIP_vector_typeIdLj4EEPS_IfLj4EES3_S1_S1_PdS1_S1_S1_S1_iPiij(double %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %2, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4, %struct.HIP_vector_type addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, %struct.HIP_vector_type addrspace(1)* nocapture readonly %7, %struct.HIP_vector_type addrspace(1)* nocapture readonly %8, %struct.HIP_vector_type addrspace(1)* nocapture readonly %9, %struct.HIP_vector_type addrspace(1)* nocapture readonly %10, i32 %11, i32 addrspace(1)* nocapture readonly %12, i32 %13, i32 %14) local_unnamed_addr #0 {
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %16, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %23, %11
  %25 = add i32 %24, %22
  %26 = add nsw i32 %13, %11
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %37, label %28

28:                                               ; preds = %15
  %29 = sub nsw i32 %25, %26
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = icmp slt i32 %32, %11
  %34 = icmp slt i32 %32, %26
  %35 = select i1 %34, i32 -1, i32 %32
  %36 = select i1 %33, i32 %32, i32 %35
  br label %37

37:                                               ; preds = %28, %15
  %38 = phi i32 [ %25, %15 ], [ %36, %28 ]
  %39 = icmp slt i32 %38, 0
  br i1 %39, label %176, label %40

40:                                               ; preds = %37
  %41 = zext i32 %38 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %6, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !11, !amdgpu.noclobber !5
  %44 = fsub contract double %0, %43
  %45 = fmul contract double %44, %44
  %46 = fmul contract double %44, %45
  %47 = fmul contract double %45, %45
  %48 = fmul contract double %44, %47
  %49 = fmul contract double %45, 5.000000e-01
  %50 = fmul contract double %46, 0x3FC5555555555555
  %51 = fmul contract double %47, 0x3FA5555555555555
  %52 = fmul contract double %48, 0x3F81111111111111
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 0
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 1
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %41, i32 0, i32 0, i32 0, i64 2
  %56 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %41, i32 0, i32 0, i32 0, i64 0
  %57 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %41, i32 0, i32 0, i32 0, i64 1
  %58 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %41, i32 0, i32 0, i32 0, i64 2
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %41, i32 0, i32 0, i32 0, i64 0
  %60 = load double, double addrspace(1)* %59, align 32, !tbaa !13, !amdgpu.noclobber !5
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %41, i32 0, i32 0, i32 0, i64 1
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !13, !amdgpu.noclobber !5
  %63 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %41, i32 0, i32 0, i32 0, i64 2
  %64 = load double, double addrspace(1)* %63, align 16, !tbaa !13, !amdgpu.noclobber !5
  %65 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %41, i32 0, i32 0, i32 0, i64 0
  %66 = load double, double addrspace(1)* %65, align 32, !tbaa !13, !amdgpu.noclobber !5
  %67 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %41, i32 0, i32 0, i32 0, i64 1
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !13, !amdgpu.noclobber !5
  %69 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %41, i32 0, i32 0, i32 0, i64 2
  %70 = load double, double addrspace(1)* %69, align 16, !tbaa !13, !amdgpu.noclobber !5
  %71 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %41, i32 0, i32 0, i32 0, i64 0
  %72 = load double, double addrspace(1)* %71, align 32, !tbaa !13, !amdgpu.noclobber !5
  %73 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %41, i32 0, i32 0, i32 0, i64 1
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !13, !amdgpu.noclobber !5
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %41, i32 0, i32 0, i32 0, i64 2
  %76 = load double, double addrspace(1)* %75, align 16, !tbaa !13, !amdgpu.noclobber !5
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %41, i32 0, i32 0, i32 0, i64 0
  %78 = load double, double addrspace(1)* %77, align 32, !tbaa !13, !amdgpu.noclobber !5
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %41, i32 0, i32 0, i32 0, i64 1
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !13, !amdgpu.noclobber !5
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %41, i32 0, i32 0, i32 0, i64 2
  %82 = load double, double addrspace(1)* %81, align 16, !tbaa !13, !amdgpu.noclobber !5
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %41, i32 0, i32 0, i32 0, i64 0
  %84 = load double, double addrspace(1)* %83, align 32, !tbaa !13, !amdgpu.noclobber !5
  %85 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %41, i32 0, i32 0, i32 0, i64 1
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !13, !amdgpu.noclobber !5
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %41, i32 0, i32 0, i32 0, i64 2
  %88 = load double, double addrspace(1)* %87, align 16, !tbaa !13, !amdgpu.noclobber !5
  %89 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %41, i32 0, i32 0, i32 0, i64 0
  %90 = load double, double addrspace(1)* %89, align 32, !tbaa !13, !amdgpu.noclobber !5
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %41, i32 0, i32 0, i32 0, i64 1
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !13, !amdgpu.noclobber !5
  %93 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %10, i64 %41, i32 0, i32 0, i32 0, i64 2
  %94 = load double, double addrspace(1)* %93, align 16, !tbaa !13, !amdgpu.noclobber !5
  %95 = fmul contract double %44, %66
  %96 = fadd contract double %60, %95
  %97 = fmul contract double %49, %72
  %98 = fadd contract double %96, %97
  %99 = fmul contract double %50, %78
  %100 = fadd contract double %98, %99
  %101 = fmul contract double %51, %84
  %102 = fadd contract double %100, %101
  %103 = fmul contract double %52, %90
  %104 = fadd contract double %102, %103
  %105 = fmul contract double %44, %68
  %106 = fadd contract double %62, %105
  %107 = fmul contract double %49, %74
  %108 = fadd contract double %106, %107
  %109 = fmul contract double %50, %80
  %110 = fadd contract double %108, %109
  %111 = fmul contract double %51, %86
  %112 = fadd contract double %110, %111
  %113 = fmul contract double %52, %92
  %114 = fadd contract double %112, %113
  %115 = fmul contract double %44, %70
  %116 = fadd contract double %64, %115
  %117 = fmul contract double %49, %76
  %118 = fadd contract double %116, %117
  %119 = fmul contract double %50, %82
  %120 = fadd contract double %118, %119
  %121 = fmul contract double %51, %88
  %122 = fadd contract double %120, %121
  %123 = fmul contract double %52, %94
  %124 = fadd contract double %122, %123
  store double %104, double addrspace(1)* %53, align 32, !tbaa !13
  store double %114, double addrspace(1)* %54, align 8, !tbaa !13
  store double %124, double addrspace(1)* %55, align 16, !tbaa !13
  %125 = fmul contract double %44, %72
  %126 = fadd contract double %66, %125
  %127 = fmul contract double %49, %78
  %128 = fadd contract double %126, %127
  %129 = fmul contract double %50, %84
  %130 = fadd contract double %128, %129
  %131 = fmul contract double %51, %90
  %132 = fadd contract double %130, %131
  %133 = fptrunc double %132 to float
  %134 = fmul contract double %44, %74
  %135 = fadd contract double %68, %134
  %136 = fmul contract double %49, %80
  %137 = fadd contract double %135, %136
  %138 = fmul contract double %50, %86
  %139 = fadd contract double %137, %138
  %140 = fmul contract double %51, %92
  %141 = fadd contract double %139, %140
  %142 = fptrunc double %141 to float
  %143 = fmul contract double %44, %76
  %144 = fadd contract double %70, %143
  %145 = fmul contract double %49, %82
  %146 = fadd contract double %144, %145
  %147 = fmul contract double %50, %88
  %148 = fadd contract double %146, %147
  %149 = fmul contract double %51, %94
  %150 = fadd contract double %148, %149
  %151 = fptrunc double %150 to float
  store float %133, float addrspace(1)* %56, align 16, !tbaa !13
  store float %142, float addrspace(1)* %57, align 4, !tbaa !13
  store float %151, float addrspace(1)* %58, align 8, !tbaa !13
  %152 = fmul contract double %44, %78
  %153 = fadd contract double %72, %152
  %154 = fmul contract double %49, %84
  %155 = fadd contract double %153, %154
  %156 = fmul contract double %50, %90
  %157 = fadd contract double %155, %156
  %158 = fptrunc double %157 to float
  %159 = fmul contract double %44, %80
  %160 = fadd contract double %74, %159
  %161 = fmul contract double %49, %86
  %162 = fadd contract double %160, %161
  %163 = fmul contract double %50, %92
  %164 = fadd contract double %162, %163
  %165 = fptrunc double %164 to float
  %166 = fmul contract double %44, %82
  %167 = fadd contract double %76, %166
  %168 = fmul contract double %49, %88
  %169 = fadd contract double %167, %168
  %170 = fmul contract double %50, %94
  %171 = fadd contract double %169, %170
  %172 = fptrunc double %171 to float
  %173 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %41, i32 0, i32 0, i32 0, i64 0
  store float %158, float addrspace(1)* %173, align 16, !tbaa !13
  %174 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %41, i32 0, i32 0, i32 0, i64 1
  store float %165, float addrspace(1)* %174, align 4, !tbaa !13
  %175 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %3, i64 %41, i32 0, i32 0, i32 0, i64 2
  store float %172, float addrspace(1)* %175, align 8, !tbaa !13
  br label %176

176:                                              ; preds = %37, %40
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
!13 = !{!9, !9, i64 0}
