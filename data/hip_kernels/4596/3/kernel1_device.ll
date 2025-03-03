; ModuleID = '../data/hip_kernels/4596/3/main.cu'
source_filename = "../data/hip_kernels/4596/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7kernel1PiS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = shl i32 %2, 3
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = add i32 %4, %5
  %7 = add i32 %4, 8
  %8 = icmp eq i32 %4, 2147483640
  br i1 %8, label %32, label %9

9:                                                ; preds = %3
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = add i32 %4, %10
  %12 = shl nsw i32 %11, 8
  %13 = add nsw i32 %12, %6
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %17 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %18 = sitofp i32 %17 to float
  %19 = add nsw i32 %4, %12
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !5
  %23 = sitofp i32 %22 to float
  %24 = shl i32 %2, 11
  %25 = add nsw i32 %24, %6
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !5
  %29 = sitofp i32 %28 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = fadd contract float %23, %29
  %31 = fcmp contract olt float %30, %18
  br i1 %31, label %33, label %35

32:                                               ; preds = %151, %168, %35, %3
  ret void

33:                                               ; preds = %9
  %34 = fptosi float %30 to i32
  store i32 %34, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %4, i32 addrspace(1)* %16, align 4, !tbaa !5
  br label %35

35:                                               ; preds = %9, %33
  %36 = add nuw nsw i32 %4, 1
  %37 = icmp slt i32 %36, %7
  br i1 %37, label %38, label %32, !llvm.loop !9

38:                                               ; preds = %35
  %39 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %40 = sitofp i32 %39 to float
  %41 = add nsw i32 %36, %12
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5
  %45 = sitofp i32 %44 to float
  %46 = shl nsw i32 %36, 8
  %47 = add nsw i32 %46, %6
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !5
  %51 = sitofp i32 %50 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = fadd contract float %45, %51
  %53 = fcmp contract olt float %52, %40
  br i1 %53, label %54, label %56

54:                                               ; preds = %38
  %55 = fptosi float %52 to i32
  store i32 %55, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %36, i32 addrspace(1)* %16, align 4, !tbaa !5
  br label %56

56:                                               ; preds = %54, %38
  %57 = add nuw nsw i32 %4, 2
  %58 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %59 = sitofp i32 %58 to float
  %60 = add nsw i32 %57, %12
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5
  %64 = sitofp i32 %63 to float
  %65 = shl nsw i32 %57, 8
  %66 = add nsw i32 %65, %6
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !5
  %70 = sitofp i32 %69 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = fadd contract float %64, %70
  %72 = fcmp contract olt float %71, %59
  br i1 %72, label %73, label %75

73:                                               ; preds = %56
  %74 = fptosi float %71 to i32
  store i32 %74, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %57, i32 addrspace(1)* %16, align 4, !tbaa !5
  br label %75

75:                                               ; preds = %73, %56
  %76 = add nuw nsw i32 %4, 3
  %77 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %78 = sitofp i32 %77 to float
  %79 = add nsw i32 %76, %12
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !5
  %83 = sitofp i32 %82 to float
  %84 = shl nsw i32 %76, 8
  %85 = add nsw i32 %84, %6
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !5
  %89 = sitofp i32 %88 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = fadd contract float %83, %89
  %91 = fcmp contract olt float %90, %78
  br i1 %91, label %92, label %94

92:                                               ; preds = %75
  %93 = fptosi float %90 to i32
  store i32 %93, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %76, i32 addrspace(1)* %16, align 4, !tbaa !5
  br label %94

94:                                               ; preds = %92, %75
  %95 = add nuw nsw i32 %4, 4
  %96 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %97 = sitofp i32 %96 to float
  %98 = add nsw i32 %95, %12
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !5
  %102 = sitofp i32 %101 to float
  %103 = shl nsw i32 %95, 8
  %104 = add nsw i32 %103, %6
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !5
  %108 = sitofp i32 %107 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %109 = fadd contract float %102, %108
  %110 = fcmp contract olt float %109, %97
  br i1 %110, label %111, label %113

111:                                              ; preds = %94
  %112 = fptosi float %109 to i32
  store i32 %112, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %95, i32 addrspace(1)* %16, align 4, !tbaa !5
  br label %113

113:                                              ; preds = %111, %94
  %114 = add nuw nsw i32 %4, 5
  %115 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %116 = sitofp i32 %115 to float
  %117 = add nsw i32 %114, %12
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !5
  %121 = sitofp i32 %120 to float
  %122 = shl nsw i32 %114, 8
  %123 = add nsw i32 %122, %6
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !5
  %127 = sitofp i32 %126 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = fadd contract float %121, %127
  %129 = fcmp contract olt float %128, %116
  br i1 %129, label %130, label %132

130:                                              ; preds = %113
  %131 = fptosi float %128 to i32
  store i32 %131, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %114, i32 addrspace(1)* %16, align 4, !tbaa !5
  br label %132

132:                                              ; preds = %130, %113
  %133 = add nuw nsw i32 %4, 6
  %134 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %135 = sitofp i32 %134 to float
  %136 = add nsw i32 %133, %12
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !5
  %140 = sitofp i32 %139 to float
  %141 = shl nsw i32 %133, 8
  %142 = add nsw i32 %141, %6
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %143
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !5
  %146 = sitofp i32 %145 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %147 = fadd contract float %140, %146
  %148 = fcmp contract olt float %147, %135
  br i1 %148, label %149, label %151

149:                                              ; preds = %132
  %150 = fptosi float %147 to i32
  store i32 %150, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %133, i32 addrspace(1)* %16, align 4, !tbaa !5
  br label %151

151:                                              ; preds = %149, %132
  %152 = add nuw nsw i32 %4, 7
  %153 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5
  %154 = sitofp i32 %153 to float
  %155 = add nsw i32 %152, %12
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %156
  %158 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !5
  %159 = sitofp i32 %158 to float
  %160 = shl nsw i32 %152, 8
  %161 = add nsw i32 %160, %6
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %162
  %164 = load i32, i32 addrspace(1)* %163, align 4, !tbaa !5
  %165 = sitofp i32 %164 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %166 = fadd contract float %159, %165
  %167 = fcmp contract olt float %166, %154
  br i1 %167, label %168, label %32

168:                                              ; preds = %151
  %169 = fptosi float %166 to i32
  store i32 %169, i32 addrspace(1)* %15, align 4, !tbaa !5
  store i32 %152, i32 addrspace(1)* %16, align 4, !tbaa !5
  br label %32
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
