; ModuleID = '../data/hip_kernels/2305/0/main.cu'
source_filename = "../data/hip_kernels/2305/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20GaussianKernelSimplePKhPhiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %215

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %4
  %28 = add i32 %27, %14
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !7, !amdgpu.noclobber !5
  %32 = uitofp i8 %31 to float
  %33 = fmul contract float %32, 0x3F68527AE0000000
  %34 = fadd contract float %33, 0.000000e+00
  %35 = add i32 %28, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !5
  %39 = uitofp i8 %38 to float
  %40 = fmul contract float %39, 0x3F8B404940000000
  %41 = fadd contract float %34, %40
  %42 = add i32 %28, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !7, !amdgpu.noclobber !5
  %46 = uitofp i8 %45 to float
  %47 = fmul contract float %46, 0x3F9676F9C0000000
  %48 = fadd contract float %41, %47
  %49 = add i32 %28, 3
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = uitofp i8 %52 to float
  %54 = fmul contract float %53, 0x3F8B404940000000
  %55 = fadd contract float %48, %54
  %56 = add i32 %28, 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7, !amdgpu.noclobber !5
  %60 = uitofp i8 %59 to float
  %61 = fmul contract float %60, 0x3F68527AE0000000
  %62 = fadd contract float %55, %61
  %63 = add nsw i32 %22, 1
  %64 = mul nsw i32 %63, %4
  %65 = add i32 %64, %14
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7, !amdgpu.noclobber !5
  %69 = uitofp i8 %68 to float
  %70 = fmul contract float %69, 0x3F8B404940000000
  %71 = fadd contract float %62, %70
  %72 = add i32 %65, 1
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !7, !amdgpu.noclobber !5
  %76 = uitofp i8 %75 to float
  %77 = fmul contract float %76, 0x3FAE8862E0000000
  %78 = fadd contract float %71, %77
  %79 = add i32 %65, 2
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7, !amdgpu.noclobber !5
  %83 = uitofp i8 %82 to float
  %84 = fmul contract float %83, 0x3FB92B8560000000
  %85 = fadd contract float %78, %84
  %86 = add i32 %65, 3
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %87
  %89 = load i8, i8 addrspace(1)* %88, align 1, !tbaa !7, !amdgpu.noclobber !5
  %90 = uitofp i8 %89 to float
  %91 = fmul contract float %90, 0x3FAE8862E0000000
  %92 = fadd contract float %85, %91
  %93 = add i32 %65, 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %94
  %96 = load i8, i8 addrspace(1)* %95, align 1, !tbaa !7, !amdgpu.noclobber !5
  %97 = uitofp i8 %96 to float
  %98 = fmul contract float %97, 0x3F8B404940000000
  %99 = fadd contract float %92, %98
  %100 = add nsw i32 %22, 2
  %101 = mul nsw i32 %100, %4
  %102 = add i32 %101, %14
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %103
  %105 = load i8, i8 addrspace(1)* %104, align 1, !tbaa !7, !amdgpu.noclobber !5
  %106 = uitofp i8 %105 to float
  %107 = fmul contract float %106, 0x3F9676F9C0000000
  %108 = fadd contract float %99, %107
  %109 = add i32 %102, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %110
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !7, !amdgpu.noclobber !5
  %113 = uitofp i8 %112 to float
  %114 = fmul contract float %113, 0x3FB92B8560000000
  %115 = fadd contract float %108, %114
  %116 = add i32 %102, 2
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !7, !amdgpu.noclobber !5
  %120 = uitofp i8 %119 to float
  %121 = fmul contract float %120, 0x3FC4BFC900000000
  %122 = fadd contract float %115, %121
  %123 = add i32 %102, 3
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %124
  %126 = load i8, i8 addrspace(1)* %125, align 1, !tbaa !7, !amdgpu.noclobber !5
  %127 = uitofp i8 %126 to float
  %128 = fmul contract float %127, 0x3FB92B8560000000
  %129 = fadd contract float %122, %128
  %130 = add i32 %102, 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %131
  %133 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !7, !amdgpu.noclobber !5
  %134 = uitofp i8 %133 to float
  %135 = fmul contract float %134, 0x3F9676F9C0000000
  %136 = fadd contract float %129, %135
  %137 = add nsw i32 %22, 3
  %138 = mul nsw i32 %137, %4
  %139 = add i32 %138, %14
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %140
  %142 = load i8, i8 addrspace(1)* %141, align 1, !tbaa !7, !amdgpu.noclobber !5
  %143 = uitofp i8 %142 to float
  %144 = fmul contract float %143, 0x3F8B404940000000
  %145 = fadd contract float %136, %144
  %146 = add i32 %139, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %147
  %149 = load i8, i8 addrspace(1)* %148, align 1, !tbaa !7, !amdgpu.noclobber !5
  %150 = uitofp i8 %149 to float
  %151 = fmul contract float %150, 0x3FAE8862E0000000
  %152 = fadd contract float %145, %151
  %153 = add i32 %139, 2
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %154
  %156 = load i8, i8 addrspace(1)* %155, align 1, !tbaa !7, !amdgpu.noclobber !5
  %157 = uitofp i8 %156 to float
  %158 = fmul contract float %157, 0x3FB92B8560000000
  %159 = fadd contract float %152, %158
  %160 = add i32 %139, 3
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %161
  %163 = load i8, i8 addrspace(1)* %162, align 1, !tbaa !7, !amdgpu.noclobber !5
  %164 = uitofp i8 %163 to float
  %165 = fmul contract float %164, 0x3FAE8862E0000000
  %166 = fadd contract float %159, %165
  %167 = add i32 %139, 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %168
  %170 = load i8, i8 addrspace(1)* %169, align 1, !tbaa !7, !amdgpu.noclobber !5
  %171 = uitofp i8 %170 to float
  %172 = fmul contract float %171, 0x3F8B404940000000
  %173 = fadd contract float %166, %172
  %174 = add nsw i32 %22, 4
  %175 = mul nsw i32 %174, %4
  %176 = add i32 %175, %14
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %177
  %179 = load i8, i8 addrspace(1)* %178, align 1, !tbaa !7, !amdgpu.noclobber !5
  %180 = uitofp i8 %179 to float
  %181 = fmul contract float %180, 0x3F68527AE0000000
  %182 = fadd contract float %173, %181
  %183 = add i32 %176, 1
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %184
  %186 = load i8, i8 addrspace(1)* %185, align 1, !tbaa !7, !amdgpu.noclobber !5
  %187 = uitofp i8 %186 to float
  %188 = fmul contract float %187, 0x3F8B404940000000
  %189 = fadd contract float %182, %188
  %190 = add i32 %176, 2
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %191
  %193 = load i8, i8 addrspace(1)* %192, align 1, !tbaa !7, !amdgpu.noclobber !5
  %194 = uitofp i8 %193 to float
  %195 = fmul contract float %194, 0x3F9676F9C0000000
  %196 = fadd contract float %189, %195
  %197 = add i32 %176, 3
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %198
  %200 = load i8, i8 addrspace(1)* %199, align 1, !tbaa !7, !amdgpu.noclobber !5
  %201 = uitofp i8 %200 to float
  %202 = fmul contract float %201, 0x3F8B404940000000
  %203 = fadd contract float %196, %202
  %204 = add i32 %176, 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %205
  %207 = load i8, i8 addrspace(1)* %206, align 1, !tbaa !7, !amdgpu.noclobber !5
  %208 = uitofp i8 %207 to float
  %209 = fmul contract float %208, 0x3F68527AE0000000
  %210 = fadd contract float %203, %209
  %211 = fadd contract float %210, 5.000000e-01
  %212 = fptosi float %211 to i32
  %213 = trunc i32 %212 to i8
  %214 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %29
  store i8 %213, i8 addrspace(1)* %214, align 1, !tbaa !7
  br label %215

215:                                              ; preds = %26, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
