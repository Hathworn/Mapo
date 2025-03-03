; ModuleID = '../data/hip_kernels/12063/1/main.cu'
source_filename = "../data/hip_kernels/12063/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ31hierarchical_scan_kernel_phase1PiS_S_E2XY = internal unnamed_addr addrspace(3) global [2048 x i32] undef, align 16
@_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z31hierarchical_scan_kernel_phase1PiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl nsw i32 %5, 11
  %7 = or i32 %6, %4
  %8 = icmp slt i32 %7, 2097152
  br i1 %8, label %9, label %158

9:                                                ; preds = %3
  %10 = sext i32 %7 to i64
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %10
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E2XY, i32 0, i32 %4
  store i32 %12, i32 addrspace(3)* %13, align 4, !tbaa !5
  %14 = or i32 %7, 1024
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = or i32 %4, 1024
  %19 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E2XY, i32 0, i32 %18
  store i32 %17, i32 addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = shl nuw nsw i32 %4, 1
  %21 = add nuw nsw i32 %20, 1
  %22 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E2XY, i32 0, i32 %20
  %23 = load i32, i32 addrspace(3)* %22, align 8, !tbaa !5
  %24 = getelementptr inbounds [2048 x i32], [2048 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E2XY, i32 0, i32 %21
  %25 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %26 = add nsw i32 %25, %23
  store i32 %26, i32 addrspace(3)* %24, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %28 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %4
  store i32 %27, i32 addrspace(3)* %28, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = icmp eq i32 %4, 0
  br i1 %29, label %42, label %38

30:                                               ; preds = %146
  %31 = add nsw i32 %4, -1
  %32 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %31
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %34 = load i32, i32 addrspace(3)* %22, align 8, !tbaa !5
  %35 = add nsw i32 %34, %33
  store i32 %35, i32 addrspace(3)* %22, align 8, !tbaa !5
  %36 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %37 = add nsw i32 %36, %33
  store i32 %37, i32 addrspace(3)* %24, align 4, !tbaa !5
  br label %148

38:                                               ; preds = %9
  %39 = add nsw i32 %4, -1
  %40 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %39
  %41 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  br label %42

42:                                               ; preds = %38, %9
  %43 = phi i32 [ %41, %38 ], [ undef, %9 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %29, label %47, label %44

44:                                               ; preds = %42
  %45 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %46 = add nsw i32 %45, %43
  store i32 %46, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %42, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ult i32 %4, 2
  br i1 %48, label %53, label %49

49:                                               ; preds = %47
  %50 = add nsw i32 %4, -2
  %51 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %50
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !5
  br label %53

53:                                               ; preds = %49, %47
  %54 = phi i32 [ %52, %49 ], [ %43, %47 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %48, label %58, label %55

55:                                               ; preds = %53
  %56 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %57 = add nsw i32 %56, %54
  store i32 %57, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %55, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = icmp ult i32 %4, 4
  br i1 %59, label %64, label %60

60:                                               ; preds = %58
  %61 = add nsw i32 %4, -4
  %62 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %61
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %60, %58
  %65 = phi i32 [ %63, %60 ], [ %54, %58 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %59, label %69, label %66

66:                                               ; preds = %64
  %67 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %68 = add nsw i32 %67, %65
  store i32 %68, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %69

69:                                               ; preds = %66, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = icmp ult i32 %4, 8
  br i1 %70, label %75, label %71

71:                                               ; preds = %69
  %72 = add nsw i32 %4, -8
  %73 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %72
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  br label %75

75:                                               ; preds = %71, %69
  %76 = phi i32 [ %74, %71 ], [ %65, %69 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %70, label %80, label %77

77:                                               ; preds = %75
  %78 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %79 = add nsw i32 %78, %76
  store i32 %79, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %80

80:                                               ; preds = %77, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp ult i32 %4, 16
  br i1 %81, label %86, label %82

82:                                               ; preds = %80
  %83 = add nsw i32 %4, -16
  %84 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %83
  %85 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !5
  br label %86

86:                                               ; preds = %82, %80
  %87 = phi i32 [ %85, %82 ], [ %76, %80 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %81, label %91, label %88

88:                                               ; preds = %86
  %89 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %90 = add nsw i32 %89, %87
  store i32 %90, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %91

91:                                               ; preds = %88, %86
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = icmp ult i32 %4, 32
  br i1 %92, label %97, label %93

93:                                               ; preds = %91
  %94 = add nsw i32 %4, -32
  %95 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %94
  %96 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !5
  br label %97

97:                                               ; preds = %93, %91
  %98 = phi i32 [ %96, %93 ], [ %87, %91 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %92, label %102, label %99

99:                                               ; preds = %97
  %100 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %101 = add nsw i32 %100, %98
  store i32 %101, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %102

102:                                              ; preds = %99, %97
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = icmp ult i32 %4, 64
  br i1 %103, label %108, label %104

104:                                              ; preds = %102
  %105 = add nsw i32 %4, -64
  %106 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %105
  %107 = load i32, i32 addrspace(3)* %106, align 4, !tbaa !5
  br label %108

108:                                              ; preds = %104, %102
  %109 = phi i32 [ %107, %104 ], [ %98, %102 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %103, label %113, label %110

110:                                              ; preds = %108
  %111 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %112 = add nsw i32 %111, %109
  store i32 %112, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %113

113:                                              ; preds = %110, %108
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = icmp ult i32 %4, 128
  br i1 %114, label %119, label %115

115:                                              ; preds = %113
  %116 = add nsw i32 %4, -128
  %117 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %116
  %118 = load i32, i32 addrspace(3)* %117, align 4, !tbaa !5
  br label %119

119:                                              ; preds = %115, %113
  %120 = phi i32 [ %118, %115 ], [ %109, %113 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %114, label %124, label %121

121:                                              ; preds = %119
  %122 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %123 = add nsw i32 %122, %120
  store i32 %123, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %124

124:                                              ; preds = %121, %119
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %125 = icmp ult i32 %4, 256
  br i1 %125, label %130, label %126

126:                                              ; preds = %124
  %127 = add nsw i32 %4, -256
  %128 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %127
  %129 = load i32, i32 addrspace(3)* %128, align 4, !tbaa !5
  br label %130

130:                                              ; preds = %126, %124
  %131 = phi i32 [ %129, %126 ], [ %120, %124 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %125, label %135, label %132

132:                                              ; preds = %130
  %133 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %134 = add nsw i32 %133, %131
  store i32 %134, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %135

135:                                              ; preds = %132, %130
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %136 = icmp ult i32 %4, 512
  br i1 %136, label %141, label %137

137:                                              ; preds = %135
  %138 = add nsw i32 %4, -512
  %139 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E3AUS, i32 0, i32 %138
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !5
  br label %141

141:                                              ; preds = %137, %135
  %142 = phi i32 [ %140, %137 ], [ %131, %135 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %136, label %146, label %143

143:                                              ; preds = %141
  %144 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %145 = add nsw i32 %144, %142
  store i32 %145, i32 addrspace(3)* %28, align 4, !tbaa !5
  br label %146

146:                                              ; preds = %143, %141
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %147 = icmp eq i32 %4, 0
  br i1 %147, label %148, label %30

148:                                              ; preds = %30, %146
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %149 = load i32, i32 addrspace(3)* %13, align 4, !tbaa !5
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %10
  store i32 %149, i32 addrspace(1)* %150, align 4, !tbaa !5
  %151 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !5
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  store i32 %151, i32 addrspace(1)* %152, align 4, !tbaa !5
  %153 = icmp eq i32 %4, 1023
  br i1 %153, label %154, label %158

154:                                              ; preds = %148
  %155 = load i32, i32 addrspace(3)* getelementptr inbounds ([2048 x i32], [2048 x i32] addrspace(3)* @_ZZ31hierarchical_scan_kernel_phase1PiS_S_E2XY, i32 0, i32 2047), align 4, !tbaa !5
  %156 = sext i32 %5 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %156
  store i32 %155, i32 addrspace(1)* %157, align 4, !tbaa !5
  br label %158

158:                                              ; preds = %148, %154, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!9 = !{}
