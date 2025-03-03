; ModuleID = '../data/hip_kernels/601/16/main.cu'
source_filename = "../data/hip_kernels/601/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14kernel_stencilPfS_S_S_S_S_S_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = icmp sgt i32 %16, 545024
  br i1 %17, label %213, label %18

18:                                               ; preds = %7
  %19 = freeze i32 %16
  %20 = sdiv i32 %19, 65
  %21 = sdiv i32 %16, 4225
  %22 = srem i32 %20, 65
  %23 = mul i32 %20, 65
  %24 = sub i32 %19, %23
  %25 = add i32 %16, -540800
  %26 = icmp ult i32 %25, -536575
  br i1 %26, label %27, label %29

27:                                               ; preds = %18
  %28 = sext i32 %16 to i64
  br label %209

29:                                               ; preds = %18
  %30 = icmp slt i32 %22, 1
  br i1 %30, label %34, label %31

31:                                               ; preds = %29
  %32 = add nsw i32 %24, 1
  %33 = icmp sgt i32 %24, 63
  br i1 %33, label %34, label %36

34:                                               ; preds = %31, %29
  %35 = zext i32 %16 to i64
  br label %209

36:                                               ; preds = %31
  %37 = mul nsw i32 %21, 4225
  %38 = mul nuw nsw i32 %22, 65
  %39 = add nsw i32 %38, %37
  %40 = add nsw i32 %39, %24
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = add nsw i32 %37, 4225
  %45 = add nsw i32 %44, %38
  %46 = add nsw i32 %45, %24
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = add nuw nsw i32 %38, 65
  %51 = add nsw i32 %50, %37
  %52 = add nsw i32 %51, %24
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = add nsw i32 %39, %32
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = add nsw i32 %44, %24
  %61 = add nsw i32 %60, %50
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = add nsw i32 %38, -65
  %66 = add nsw i32 %60, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = add i32 %37, -4225
  %71 = add i32 %70, %24
  %72 = add i32 %71, %50
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !6
  %76 = add i32 %71, %65
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  %80 = add nsw i32 %51, %32
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !6
  %84 = add nsw i32 %65, %37
  %85 = add nsw i32 %84, %32
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !6
  %89 = add nsw i32 %24, -1
  %90 = add nsw i32 %51, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = add nsw i32 %84, %89
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = add nsw i32 %45, %32
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = add nsw i32 %70, %38
  %103 = add nsw i32 %102, %32
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = add nsw i32 %45, %89
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !6
  %111 = add nsw i32 %102, %89
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !6
  %115 = add nsw i32 %102, %24
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !6
  %119 = add nsw i32 %84, %24
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !6
  %123 = add nsw i32 %39, %89
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !6
  %127 = fpext float %43 to double
  %128 = mul nsw i32 %21, 16900
  %129 = mul nuw nsw i32 %22, 260
  %130 = shl nsw i32 %24, 2
  %131 = add i32 %130, %128
  %132 = add i32 %131, %129
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !6
  %136 = fmul contract float %49, %135
  %137 = or i32 %132, 1
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %2, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !6
  %141 = fmul contract float %55, %140
  %142 = fadd contract float %136, %141
  %143 = or i32 %132, 2
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !6
  %147 = fmul contract float %59, %146
  %148 = fadd contract float %142, %147
  %149 = mul nsw i32 %21, 12675
  %150 = mul nuw nsw i32 %22, 195
  %151 = mul nsw i32 %24, 3
  %152 = add i32 %151, %149
  %153 = add i32 %152, %150
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %3, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !6
  %157 = fsub contract float %64, %69
  %158 = fsub contract float %157, %75
  %159 = fadd contract float %158, %79
  %160 = fmul contract float %159, %156
  %161 = fadd contract float %148, %160
  %162 = add nsw i32 %153, 1
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %3, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !6
  %166 = fsub contract float %83, %88
  %167 = fsub contract float %166, %93
  %168 = fadd contract float %167, %97
  %169 = fmul contract float %168, %165
  %170 = fadd contract float %161, %169
  %171 = add nsw i32 %153, 2
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %3, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !7, !amdgpu.noclobber !6
  %175 = fsub contract float %101, %106
  %176 = fsub contract float %175, %110
  %177 = fadd contract float %176, %114
  %178 = fmul contract float %177, %174
  %179 = fadd contract float %170, %178
  %180 = getelementptr inbounds float, float addrspace(1)* %4, i64 %154
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7, !amdgpu.noclobber !6
  %182 = fmul contract float %118, %181
  %183 = fadd contract float %179, %182
  %184 = getelementptr inbounds float, float addrspace(1)* %4, i64 %163
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7, !amdgpu.noclobber !6
  %186 = fmul contract float %122, %185
  %187 = fadd contract float %183, %186
  %188 = getelementptr inbounds float, float addrspace(1)* %4, i64 %172
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !7, !amdgpu.noclobber !6
  %190 = fmul contract float %126, %189
  %191 = fadd contract float %187, %190
  %192 = getelementptr inbounds float, float addrspace(1)* %5, i64 %41
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !7, !amdgpu.noclobber !6
  %194 = fadd contract float %193, %191
  %195 = or i32 %132, 3
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %2, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !7, !amdgpu.noclobber !6
  %199 = fmul contract float %198, %194
  %200 = fsub contract float %199, %43
  %201 = getelementptr inbounds float, float addrspace(1)* %6, i64 %41
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !7, !amdgpu.noclobber !6
  %203 = fmul contract float %202, %200
  %204 = fpext float %203 to double
  %205 = fmul contract double %204, 8.000000e-01
  %206 = fadd contract double %205, %127
  %207 = fptrunc double %206 to float
  %208 = zext i32 %16 to i64
  br label %209

209:                                              ; preds = %36, %34, %27
  %210 = phi i64 [ %28, %27 ], [ %35, %34 ], [ %208, %36 ]
  %211 = phi float [ 0.000000e+00, %27 ], [ 0.000000e+00, %34 ], [ %207, %36 ]
  %212 = getelementptr inbounds float, float addrspace(1)* %0, i64 %210
  store float %211, float addrspace(1)* %212, align 4, !tbaa !7
  br label %213

213:                                              ; preds = %209, %7
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
