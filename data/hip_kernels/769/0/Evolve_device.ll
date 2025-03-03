; ModuleID = '../data/hip_kernels/769/0/main.cu'
source_filename = "../data/hip_kernels/769/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6EvolvePbPfdiS_(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, double %2, i32 %3, i8 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %3
  %24 = icmp slt i32 %14, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %180

26:                                               ; preds = %5
  %27 = add i32 %22, %3
  %28 = add i32 %14, %3
  %29 = add i32 %28, -1
  %30 = add i32 %27, -1
  %31 = srem i32 %30, %3
  %32 = srem i32 %29, %3
  %33 = mul nsw i32 %32, %3
  %34 = add nsw i32 %33, %31
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %38 = icmp eq i8 %37, 0
  %39 = select i1 %38, float 0.000000e+00, float 1.000000e+00
  %40 = srem i32 %28, %3
  %41 = mul nsw i32 %40, %3
  %42 = add nsw i32 %41, %31
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %46 = icmp eq i8 %45, 0
  %47 = fadd contract float %39, 1.000000e+00
  %48 = select i1 %46, float %39, float %47
  %49 = add i32 %28, 1
  %50 = srem i32 %49, %3
  %51 = mul nsw i32 %50, %3
  %52 = add nsw i32 %51, %31
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %56 = icmp eq i8 %55, 0
  %57 = fadd contract float %48, 1.000000e+00
  %58 = select i1 %56, float %48, float %57
  %59 = srem i32 %27, %3
  %60 = add nsw i32 %33, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %64 = icmp eq i8 %63, 0
  %65 = fadd contract float %58, 1.000000e+00
  %66 = select i1 %64, float %58, float %65
  %67 = add nsw i32 %41, %59
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %68
  %70 = load i8, i8 addrspace(1)* %69, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %71 = icmp eq i8 %70, 0
  %72 = fadd contract float %66, 1.000000e+00
  %73 = select i1 %71, float %66, float %72
  %74 = add nsw i32 %51, %59
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %75
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %78 = icmp eq i8 %77, 0
  %79 = fadd contract float %73, 1.000000e+00
  %80 = select i1 %78, float %73, float %79
  %81 = add i32 %27, 1
  %82 = srem i32 %81, %3
  %83 = add nsw i32 %33, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %87 = icmp eq i8 %86, 0
  %88 = fadd contract float %80, 1.000000e+00
  %89 = select i1 %87, float %80, float %88
  %90 = add nsw i32 %41, %82
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %91
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %94 = icmp eq i8 %93, 0
  %95 = fadd contract float %89, 1.000000e+00
  %96 = select i1 %94, float %89, float %95
  %97 = add nsw i32 %51, %82
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %98
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %101 = icmp eq i8 %100, 0
  %102 = fadd contract float %96, 1.000000e+00
  %103 = select i1 %101, float %96, float %102
  %104 = mul nsw i32 %14, %3
  %105 = add nsw i32 %104, %22
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %106
  %108 = load i8, i8 addrspace(1)* %107, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %109 = icmp eq i8 %108, 0
  %110 = fpext float %103 to double
  %111 = fmul contract double %110, %2
  %112 = fptrunc double %111 to float
  %113 = select i1 %109, float %112, float %103
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  store float %113, float addrspace(1)* %114, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !12
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !12
  %118 = fcmp contract olt float %115, %117
  %119 = select i1 %118, i32 %34, i32 %105
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !12
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !12
  %125 = fcmp contract olt float %122, %124
  %126 = select i1 %125, i32 %42, i32 %119
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !12
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !12
  %132 = fcmp contract olt float %129, %131
  %133 = select i1 %132, i32 %52, i32 %126
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !12
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !12
  %139 = fcmp contract olt float %136, %138
  %140 = select i1 %139, i32 %60, i32 %133
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !12
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !12
  %146 = fcmp contract olt float %143, %145
  %147 = select i1 %146, i32 %67, i32 %140
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !12
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !12
  %153 = fcmp contract olt float %150, %152
  %154 = select i1 %153, i32 %74, i32 %147
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !12
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !12
  %160 = fcmp contract olt float %157, %159
  %161 = select i1 %160, i32 %83, i32 %154
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %1, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !12
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !12
  %167 = fcmp contract olt float %164, %166
  %168 = select i1 %167, i32 %90, i32 %161
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !12
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !12
  %174 = fcmp contract olt float %171, %173
  %175 = select i1 %174, i32 %97, i32 %168
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %176
  %178 = load i8, i8 addrspace(1)* %177, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %179 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %106
  store i8 %178, i8 addrspace(1)* %179, align 1, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %180

180:                                              ; preds = %5, %26
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !9, i64 0}
