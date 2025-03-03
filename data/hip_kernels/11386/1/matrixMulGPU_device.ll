; ModuleID = '../data/hip_kernels/11386/1/main.cu'
source_filename = "../data/hip_kernels/11386/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12matrixMulGPUPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %12, 15
  %22 = icmp slt i32 %20, 15
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %176

24:                                               ; preds = %3
  %25 = mul nsw i32 %12, 15
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = sext i32 %20 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = mul nsw i32 %31, %28
  %33 = add nsw i32 %25, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = add nsw i32 %20, 15
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = mul nsw i32 %40, %36
  %42 = add nsw i32 %41, %32
  %43 = add nsw i32 %25, 2
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = add nsw i32 %20, 30
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = mul nsw i32 %50, %46
  %52 = add nsw i32 %51, %42
  %53 = add nsw i32 %25, 3
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = add nsw i32 %20, 45
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = mul nsw i32 %60, %56
  %62 = add nsw i32 %61, %52
  %63 = add nsw i32 %25, 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = add nsw i32 %20, 60
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = mul nsw i32 %70, %66
  %72 = add nsw i32 %71, %62
  %73 = add nsw i32 %25, 5
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = add nsw i32 %20, 75
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = mul nsw i32 %80, %76
  %82 = add nsw i32 %81, %72
  %83 = add nsw i32 %25, 6
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = add nsw i32 %20, 90
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = mul nsw i32 %90, %86
  %92 = add nsw i32 %91, %82
  %93 = add nsw i32 %25, 7
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = add nsw i32 %20, 105
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = mul nsw i32 %100, %96
  %102 = add nsw i32 %101, %92
  %103 = add nsw i32 %25, 8
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = add nsw i32 %20, 120
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %108
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = mul nsw i32 %110, %106
  %112 = add nsw i32 %111, %102
  %113 = add nsw i32 %25, 9
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = add nsw i32 %20, 135
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !5
  %121 = mul nsw i32 %120, %116
  %122 = add nsw i32 %121, %112
  %123 = add nsw i32 %25, 10
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = add nsw i32 %20, 150
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = mul nsw i32 %130, %126
  %132 = add nsw i32 %131, %122
  %133 = add nsw i32 %25, 11
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = add nsw i32 %20, 165
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %138
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = mul nsw i32 %140, %136
  %142 = add nsw i32 %141, %132
  %143 = add nsw i32 %25, 12
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %144
  %146 = load i32, i32 addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = add nsw i32 %20, 180
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %148
  %150 = load i32, i32 addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = mul nsw i32 %150, %146
  %152 = add nsw i32 %151, %142
  %153 = add nsw i32 %25, 13
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %154
  %156 = load i32, i32 addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !5
  %157 = add nsw i32 %20, 195
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %158
  %160 = load i32, i32 addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = mul nsw i32 %160, %156
  %162 = add nsw i32 %161, %152
  %163 = add nsw i32 %25, 14
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %164
  %166 = load i32, i32 addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  %167 = add nsw i32 %20, 210
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %168
  %170 = load i32, i32 addrspace(1)* %169, align 4, !tbaa !7, !amdgpu.noclobber !5
  %171 = mul nsw i32 %170, %166
  %172 = add nsw i32 %171, %162
  %173 = add nsw i32 %25, %20
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %174
  store i32 %172, i32 addrspace(1)* %175, align 4, !tbaa !7
  br label %176

176:                                              ; preds = %24, %3
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
